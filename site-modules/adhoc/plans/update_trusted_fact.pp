# @summary PE plan to update trusted pp_role to role set by VRA
# 
# lint:ignore:140chars
#
#
#
#
#
plan adhoc::update_trusted_fact (
  TargetSpec $targets,
  String     $pe_primary_server  = 'ip-172-31-0-172.ap-southeast-2.compute.internal',
  Boolean    $noop               = false,
) {
  # get targets
  $full_list = get_targets($targets)

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

    # Retrieve fact from host
    $facts_targets = $supported_targets.map | $target | {
      $fact = puppetdb_query("facts[certname, name, value] { name = \"puppet_vra_properties\" and certname = \"${target}\" }")
    }

    # out::message("Role fact is ${facts_targets}")

    # Get hosts and roles.
    $target_role = $facts_targets.reduce({}) | $memo, $value | {
      $host = $value[0]['certname']
      $role = $value[0]['value']['Puppet.RoleClass']
      $memo + { $host => $role }
    }

    #out::message("target role ${target_role}")

    # filter for invalid roles
    $valid_roles = $target_role.filter | $host, $role | {
      #out::message("host is ${host} value is ${role}")
      if $role.length < 5 {
        out::message("Role too small ${role}")
        false
      } else {
        if $role !~ '^role::' {
          out::message("Role does not start with role:: Host: ${host} Role ${role}")
          false
        } else {
          true
        }
      }
    }

    out::message("target role ${valid_roles}")

    $results = $valid_roles.map | $host, $role | {
      out::message("host is ${host} role is ${role}")
      $apply_results = apply($host,
                            '_description'  => 'Apply block: apply fact',
                            '_catch_errors' => true,
                            '_noop'         => $noop,) {
        if $facts['os']['family'] == 'Windows' {
          $file_path = 'C:\ProgramData\PuppetLabs\puppet\etc\csr_attributes.yaml'
        } else {
          $file_path = '/etc/puppetlabs/puppet/csr_attributes.yaml'
        }

        $csr_contents = @("EOT")
          ---
          extension_requests:
            pp_role: ${role}
          | EOT

        file {$file_path:
          ensure  => present,
          content => $csr_contents,
          mode    => '0744',
        }
      }
      $successful_apply_host = $apply_results.ok_set.names
      out::message("Host ${successful_apply_host} was successful at updating CSR")

      if $successful_apply_host != undef {
        # Delete existing cert on agent
        $clear_ssl_cert_results = run_task('adhoc::update_cert_csr', $successful_apply_host, {'_catch_errors' => true, '_noop' => $noop, 'noop' => $noop })
        if $noop != true {
          if $successful_apply_host[0] != $pe_primary_server {
            run_command("puppet node purge ${successful_apply_host[0]}", $pe_primary_server)
          }
        }
      }
    }
  }
}
# lint:endignore
