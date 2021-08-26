# Class: profile::hardened_linux
#
#
class profile::base_hardened_linux {
  #include cem_linux
    $timeservers = { 'server 1.1.1.1' => 'iburst minpoll 4 maxpoll 4'}


    augeas { "chrony_d_agues":
      context => '/files/etc/chrony.conf',
      incl    => '/etc/chrony.conf',
      changes => 'set server[1] 1.1.1.1 iburst minpoll 4 maxpoll 4',
    }

    augeas {"more stuff":
      context => '/files/etc/chrony.conf',
      incl    => '/etc/chrony.conf',
      changes => 'touch server[1]/minpoll=4'
    }

    augeas {"more s123tuff":
      context => '/files/etc/chrony.conf',
      incl    => '/etc/chrony.conf',
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
