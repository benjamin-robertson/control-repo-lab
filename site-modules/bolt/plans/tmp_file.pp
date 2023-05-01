plan bolt::tmp_file (
  Targetspec $targets,
) {
  # Get targets
  $full_list = get_targets($targets)

  unless $full_list.empty {
    $apply_results = apply($full_list,
                          '_description'  => 'test apply block for APL',
                          '_catch_errors' => true) {
      include role::tmp_file
    }
    $summary_results = {
      'apply_results' => $apply_results,
    }
    return($summary_results)
  }
}
