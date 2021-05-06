plan bolt::first_patch (
  String $patch_group,
) {

  $nodes_to_patch = puppetdb_query("inventory[certname] { facts.patchme = \"true\" }")


  #$patch_results = run_task('pe_patch::last_boot_time_nix', $nodes_to_patch)

  return({
    'patch_results'  => $patch_results,
    'nodes_to_patch' => $nodes_to_patch,
  })
}
