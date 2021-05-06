plan bolt::first_patch (
  String $patch_group,
) {

  $nodes_to_patch = puppetdb_query("inventory[certname] { facts.patchme = \"true\" }")

  #turn into targetspec
  $filtered_nodes = $nodes_to_patch.map | $i | { $i['certname']}
  $targets = get_targets($filtered_nodes)

  $patch_results = run_task('bolt::unset_patch_fact',
                            $targets,
                            $factfile => '/opt/puppetlabs/facter/facts.d/patchme.txt',
                            $factname => 'patchme',
                  )


  return({
    'patch_results'  => $patch_results,
    'nodes_to_patch' => $nodes_to_patch,
    'filtered_nodes' => $filtered_nodes,
    'targets'        => $targets,
  })
}
