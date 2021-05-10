plan bolt::test_patch (
  String $node,
) {

  $to_patch = run_task('pe_patch::patch_server',
                              $node,
                              reboot          => 'patched',
                              security_only   => false,
                              '_catch_errors' => true
  )

  return({
    'to_patch'           => $to_patch,
  })

}
