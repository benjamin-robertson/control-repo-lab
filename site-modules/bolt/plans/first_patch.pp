plan bolt::first_patch (
  String $patch_fact,
) {

  $nodes_to_patch = puppetdb_query("inventory[certname] { facts.patchme = \"true\" }")

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
  }

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
