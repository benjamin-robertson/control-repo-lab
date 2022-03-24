plan bolt::test_apply (
  TargetSpec $node_names,
  String $file_name,
)
{
  # Get targets to run on
  $nodes_to_run = get_targets($node_names)

  $apply_result = apply($nodes_to_run,
                        _catch_errors => true,
                        _noop => false,
                        _run_as => root ) {

                          # Create the file
                          file { $file_name:
                            content => 'This is content from puppet file resource'
                          }
                        }

  #read the file
  $result = run_task('bolt::ls_it', $nodes_to_run, 'filename' => $file_name)
}
