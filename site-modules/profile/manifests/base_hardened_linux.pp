# Class: profile::hardened_linux
#
#
class profile::base_hardened_linux {
  #include cem_linux
    $timeservers = { 'server 1.1.1.1' => 'iburst minpoll 4 maxpoll 4'}
    Augeas {
      context => '/files/etc/chrony.conf'
    }

    augeas { "chrony_d_agues":
      changes => 'set server[1] 1.1.1.1',
    }

    augeas {"more stuff":
      changes => 'touch server[1]/prefer'
    }

    augeas {"more s123tuff":
      changes => 'touch server[1]/iburst'
    }

    #$_parts = split($timeservers[0], /\s+/)
    #augeas { "chrony_${_parts[0]}_${_parts[1]}":
    #  changes => "set ${_parts[0]}[1] ${_parts[1]}",
    #}
    #if size($_parts) > 2 {
    #  $_parts[2, -1].each | String $prt | {
    ##    augeas { "chrony_${_parts[0]}_${_parts[1]}_${prt}":
    #     changes => "touch ${_parts[0]}[1]/${prt}",
    #   }
    # }
  # }
}
