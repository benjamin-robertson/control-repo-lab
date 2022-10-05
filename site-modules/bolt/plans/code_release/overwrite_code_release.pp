# @summary PE plan to overwrite code_release fact on nodes
# 
# lint:ignore:140chars
#
# The plan overwrites the code_release fact on Windows and Linux nodes. Plan accepts an existing release name and will update all releases
# to match that release. Fact is set as an external fact under
# '/opt/puppetlabs/facter/facts.d/code_release.txt' on Linux and C:\\ProgramData\\PuppetLabs\\facter\\facts.d\\code_release.txt on Windows.
# 
# This fact can be used to classify nodes to a release branch. 
# 
# @param existing_fact_value Existing code_relesae fact value to match
# @param new_fact_value Value to set the code_release fact too.
# @param noop Whether to run the plan in noop mode. (make no changes). Default: false
# @param run_puppet Whether to run puppet agent in noop mode after setting the fact. Default: true
# 
plan bolt::code_release::overwrite_code_release (
  String  $existing_fact_value,
  String  $new_fact_value,
  Boolean $noop                 = false,
  Boolean $run_puppet           = true,
) {
  $fact_name = 'code_release'
  $full_list = puppetdb_query("inventory[certname] { facts.code_release = \"${existing_fact_value}\" }")
  unless $full_list.empty {
    # Update facts
    # without_default_logging() || { run_plan(facts, targets => $full_list) }

    # supported platforms
    $supported_platforms = ['Debian', 'RedHat', 'windows']

    $supported_targets = get_targets($full_list).filter | $target | {
      $target.facts['os']['family'] in $supported_platforms
    }

    out::message("Supported targets are ${supported_targets}")

    # apply the fact to hosts
    $apply_results = apply($supported_targets,
                          '_description'  => 'Apply block: apply fact',
                          '_catch_errors' => true,
                          '_noop'         => $noop,) {
      if $facts['os']['family'] == 'Windows' {
        $file_path = 'C:\\ProgramData\\PuppetLabs\\facter\\facts.d\\'
      } else {
        $file_path = '/opt/puppetlabs/facter/facts.d/'
      }

      file {'set fact':
        ensure  => present,
        mode    => '0644',
        path    => "${file_path}/${fact_name}.txt",
        content => "${fact_name}=${new_fact_value}",
      }
    }

    out::message("Apply results are ${apply_results}")

    $successful_hosts_fact = $apply_results.ok_set.names
    $failed_hosts_fact = $apply_results.error_set.names

    if $run_puppet {
      $puppet_results = run_task('enterprise_tasks::run_puppet', $successful_hosts_fact, {'additional_args' => ['--noop']})
      $successful_host_puppet = $puppet_results.ok_set.names
      $failed_host_puppet = $puppet_results.error_set.names
    }

    $original_successful_hosts_fact = defined('$successful_hosts_fact') ? {
      true    => $successful_hosts_fact,
      default => {},
    }
    $original_failed_hosts_fact = defined('$failed_hosts_fact') ? {
      true    => $failed_hosts_fact,
      default => {},
    }
    $original_successful_host_puppet = defined('$successful_host_puppet') ? {
      true    => $successful_host_puppet,
      default => {},
    }
    $original_failed_host_puppet = defined('$failed_host_puppet') ? {
      true    => $failed_host_puppet,
      default => {},
    }

    if $supported_targets.empty {
      $plan_result = 'fail'
    } else {
      if $supported_targets.length == $successful_hosts_fact.length {
        $plan_result = 'success'
      } else {
        $plan_result = 'fail'
      }
    }

    $summary_results = {
      'all_matching_nodes'          => $full_list,
      'successful_hosts_fact_set'   => $original_successful_hosts_fact,
      'failed_hosts_fact_set'       => $original_failed_hosts_fact,
      'successful_hosts_puppet_run' => $original_successful_host_puppet,
      'failed_host_puppet_run'      => $original_failed_host_puppet,
    }

    if ( $plan_result == 'fail' ) {
      fail_plan('Plan fail on some or all nodes', 'errors-found', {'result' => $summary_results })
    } else {
      return($summary_results)
    }
  }
  else {
    fail("No valid nodes specified, confirm the pql query 'inventory[certname] { facts.code_release = \"${existing_fact_value}\"' } returns matching nodes")
  }
}
# lint:endignore
