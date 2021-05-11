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

#  $nodes_to_unset_fact = $to_patch.map | $d | {
#      if $d['message'] == 'No patches to apply'{
#        dig($d, ['target'])
#        #out::message("What is in d ${d[target]}")
#      }
#    }

  out::message("to_patch : ${to_patch}")

  $filtered_nodes_to_unset_fact = $to_patch.filter | $d | { $d[message] == 'No patches to apply' }
  $filtered_nodes_to_unset_fact.each | Hash $c | { out::message("c equals ${c}" ) }
  #$filtered_nodes_to_unset_fact.each | Hash $c | { out::message($c.dig('value')) }
  #$nodes_to_unset_fact = get_targets($filtered_nodes_to_unset_fact)



  #out::message("filtered_nodes_to_unset_fact : ${filtered_nodes_to_unset_fact}")
  #out::message("nodes_to_unset_fact : ${nodes_to_unset_fact}")

  #$to_patch.map | $da | { $da.each | $in | { out::message("resultssss: ${in}") } }
  #$to_patch.map | $da | { out::message("resultssss: ${da}") }
  #$to_patch.map | $da | { out::message("resultssss: ${da}") }
  #$to_patch.each | $da | { $da }


  #$unset_fact_result = run_task('initial_patch::unset_patch_fact',
  #                          $nodes_to_unset_fact,
  #                          factfile => $factfile,
  #                          factname => $factname,
  #                )

  return({
    #'unset_fact_result'  => $unset_fact_result,
    'nodes_to_patch'     => $nodes_to_patch,
    'filtered_nodes'     => $filtered_nodes_to_patch,
    'targets'            => $nodes_to_patch_targets,
    'to_patch'           => $to_patch,
  })
}
