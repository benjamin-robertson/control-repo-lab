plan bolt::test_apply (
  TargetSpec $node_names,
  String $file_name,
)
{
  # Get targets to run on
  $nodes_to_run = get_targets($node_names)

  #$apply_result = apply()

  #read the file
  $result = run_task('ls_it', 'filename' => $file_name)
}
