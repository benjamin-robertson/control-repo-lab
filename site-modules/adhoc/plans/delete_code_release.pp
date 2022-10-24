# @summary PE plan to delete code_release fact on nodes
# 
# lint:ignore:140chars
#
# The plan deletes the code_release fact on Windows and Linux nodes. Fact is set as an external fact under
# '/opt/puppetlabs/facter/facts.d/code_release.txt' on Linux and C:\\ProgramData\\PuppetLabs\\facter\\facts.d\\code_release.txt on Windows.
# 
# This plan can be used to remove nodes from a release branch. You can either specifiy targets to remove fact from OR the existing fact value. 
# 
# @param targets comma seperated list of targets to run on. Target name must match certname used by Puppet.
# @param existing_fact_value existing code_release fact value to clear. 
# @param noop Whether to run the plan in noop mode. (make no changes). Default: false
# @param run_puppet Whether to run puppet agent in noop mode after setting the fact. Default: true
# 
plan adhoc::delete_code_release (
  Optional[TargetSpec] $targets              = undef,
  Optional[String]     $existing_fact_value  = undef,
  Boolean              $noop                 = false,
  Boolean              $run_puppet           = true,
) {
  # check to ensure both facts are not set. Fail plan if so.
  if $targets != undef and $existing_fact_value != undef {
    fail('Cannot set both target and existing_fact_value.')
  }

  if $existing_fact_value != undef {
    $puppetdb_results = puppetdb_query("inventory[certname] { facts.code_release = \"${existing_fact_value}\" }")
    $full_list = $puppetdb_results.map | Hash $node | { $node['certname'] }
  } else {
    $full_list = get_targets($targets)
  }
  $fact_name = 'code_release'

  unless $full_list.empty {
    # Check connection to hosts. run_plan does not exit cleanly if there is a host which doesnt exist or isnt connected, We use this task
    # to check if hosts are valid and have a valid connection to PE. This can be switched to a faster running task to speed up plan 
    # execution as we do not actually use the results from this task.
    $factresults = run_task(facts, $full_list, _catch_errors => true)

    $full_list_failed = $factresults.error_set.names
    $full_list_success = $factresults.ok_set.names

    # Update facts
    without_default_logging() || { run_plan(facts, targets => $full_list_success) }

    # supported platforms
    $supported_platforms = ['Debian', 'RedHat', 'windows']

    $supported_targets = get_targets($full_list_success).filter | $target | {
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
        ensure => absent,
        path   => "${file_path}/${fact_name}.txt",
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

    $original_full_list_failed = defined('$full_list_failed') ? {
      true    => $full_list_failed,
      default => {},
    }
    $original_failed_hosts_fact = defined('$failed_hosts_fact') ? {
      true    => $failed_hosts_fact,
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
      'all_nodes'                   => $full_list,
      'failed_or_non_existent_nosts' => $original_full_list_failed,
      'failed_hosts_fact_set'       => $original_failed_hosts_fact,
      'failed_host_puppet_run'      => $original_failed_host_puppet,
    }

    if ( $plan_result == 'fail' ) {
      fail_plan('Plan fail on some or all nodes', 'errors-found', {'result' => $summary_results })
    } else {
      return($summary_results)
    }
  }
  else {
    fail('No valid nodes specified')
  }
}
# lint:endignore
