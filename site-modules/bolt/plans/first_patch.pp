plan bolt::first_patch (
  String $patch_fact,
) {

  $nodes = puppetdb_query('inventory[certname] { facts.patchme = true }')

  #Peform health check
  $health_checks = run_task('puppet_health_check::agent_health',
                          $nodes,
                          '_catch_errors'        => true,
  )

  $nodes_to_patch = $health_checks.filter | $items | { $items.value['state'] == 'clean' }
  $nodes_skipped  = $health_checks.filter | $items | { $items.value['state'] != 'clean' }

  $skipped_targets = $nodes_skipped.map | $value | { $value['certname'] }
  out::message("Skipping the following nodes due to health check failures : ${nodes_skipped}")

  #turn into targetspec
  $filtered_nodes = $nodes_to_patch.map | $i | { $i['certname']}
  $targets = get_targets($filtered_nodes)

  #case $facts['os']['family'] {
  #  'windows': {
      $factfile = 'C:\ProgramData\PuppetLabs\facter\facts.d\patchme.yaml'
      $factname = 'patchme'
  #  }
  #  'RedHat': {
  #    $factfile = '/opt/puppetlabs/facter/facts.d/patchme.txt'
  #    $factname = 'patchme'
  #  }
  #  default: { fail('Unsupported operating system, bailing out!!') }
  #}

  $unset_fact_result = run_task('initial_patch::unset_patch_fact',
                            $targets,
                            factfile => $factfile,
                            factname => $factname,
                  )

  # Run the patch job
  $to_patch = run_task('pe_patch::patch_server',
                              $targets,
                              reboot          => 'patched',
                              security_only   => false,
                              '_catch_errors' => true
                    )

  return({
    'unset_fact_result'  => $unset_fact_result,
    'nodes_to_patch'     => $nodes_to_patch,
    'filtered_nodes'     => $filtered_nodes,
    'targets'            => $targets,
    'to_patch'           => $to_patch,
  })
}
