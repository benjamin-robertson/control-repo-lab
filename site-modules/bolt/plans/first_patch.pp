plan bolt::first_patch (
  String $patch_group,
) {

  $patch_results = run_task('pe_patch::last_boot_time_nix', $patch_group)

  return({
    'patch_results' => $patch_results,
  })
}
