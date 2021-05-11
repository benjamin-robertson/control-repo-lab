plan bolt::first_patch (
  String $patch_fact,
) {

  $nodes_to_check = puppetdb_query('inventory[certname] { facts.patchme = true }')
  $filtered_nodes_to_check = $nodes_to_check.map | $i | { $i['certname']}
  $nodes_to_check_targets = get_targets($filtered_nodes_to_check)

  #Peform health check
  $health_checks = run_task('pe_patch::agent_health',
                          $filtered_nodes_to_check,
                          '_catch_errors'        => true,
  )

  $nodes_to_patch = $health_checks.filter | $items | { $items.value['state'] == 'clean' }
  $nodes_skipped  = $health_checks.filter | $items | { $items.value['state'] != 'clean' }

  $skipped_targets = $nodes_skipped.map | $value | { $value['certname'] }
  out::message("Skipping the following nodes due to health check failures : ${nodes_skipped}")

  #turn into targetspec
  $filtered_nodes_to_patch = $nodes_to_patch.map | $i | { $i['certname']}
  $nodes_to_patch_targets = get_targets($filtered_nodes_to_patch)

  #case $facts['os']['family'] {
  #  'windows': {
  #    $factfile = 'C:\ProgramData\PuppetLabs\facter\facts.d\patchme.yaml'
  #    $factname = 'patchme'
  #  }
  #  'RedHat': {
  #    $factfile = '/opt/puppetlabs/facter/facts.d/patchme.txt'
  #    $factname = 'patchme'
  #  }
  #  default: { fail('Unsupported operating system, bailing out!!') }
  #}

  $factname = 'patchme'
  $factfile = 'C:\ProgramData\PuppetLabs\facter\facts.d\patchme.yaml'

  # Run the patch job
  $to_patch = run_task('pe_patch::patch_server',
                              $nodes_to_patch_targets,
                              reboot          => 'patched',
                              security_only   => false,
                              '_catch_errors' => true
                    )

  out::message("to_patch : ${to_patch}")

  # check which nodes have completed patching
  $filtered_nodes_to_unset_fact = $to_patch.filter | $d | { $d[message] == 'No patches to apply' }
  $nodes_to_unset_fact = $filtered_nodes_to_unset_fact.map | $result | { $result.target }
  $unset_fact_targets = get_targets($nodes_to_unset_fact)

  out::message("nodes_to_unset_fact : ${nodes_to_unset_fact}")
  out::message("unset_fact_targets : ${unset_fact_targets}")

  # Unset the patchme fact on nodes which have been patched. 
  $unset_fact_result = run_task('initial_patch::unset_patch_fact',
                            $unset_fact_targets,
                            factfile => $factfile,
                            factname => $factname,
                  )

  # Run Puppet agent on nodes which have had the fact unset.
  $puppet_run = run_task('enterprise_tasks::run_puppet', $unset_fact_result,
                    max_timeout     => 256,
                    '_catch_errors' => true,
                  )

  return({
    'unset_fact_result'  => $unset_fact_result,
    'nodes_to_patch'     => $nodes_to_patch,
    'filtered_nodes'     => $filtered_nodes_to_patch,
    'targets'            => $nodes_to_patch_targets,
    'to_patch'           => $to_patch,
    'puppet_run'         => $puppet_run,
  })
}
