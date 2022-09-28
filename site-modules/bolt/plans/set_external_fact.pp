plan bolt::set_external_fact (
  TargetSpec $targets,
  String     $fact_value,
  String     $fact_name   = 'code_release',
  Boolean    $noop        = false,
) {
  $full_list = get_targets($targets)
  unless $full_list.empty {

    # supported platforms
    $supported_platforms = ['Debian', 'RedHat']

    out::message("Full targets are ${full_list}")

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
        $path = 'C:\\ProgramData\\PuppetLabs\\facter\\facts.d\\'
      } else {
        $path = '/opt/puppetlabs/facter/facts.d/'
      }


      file {'set fact':
        ensure  => present,
        mode    => '0644',
        path    => $path,
        content => "${fact_name}=${fact_value}",
      }
    }

    out::message("Apply results are ${apply_results}")

  }
  else {
    fail('No valid nodes specified')
  }
}
