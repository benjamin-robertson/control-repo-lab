class profile::windows::registry {
  #IE ESC values required
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => 'present',
    type   => 'dword',
    data   => '1',
  }
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure  => 'present',
    type    => 'dword',
    data    => '1',
    require => Registry_value['HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled'],
  }

  # Set the array values for IE ESC
  $regpath = ['HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap','HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap']

  $regpath.each |String $regpathuse| {
    # TODO: Indentation should be increased here since it's inside a set of braces, each
    # time you open a brace (,[ or { without closing it, all lines afterward should be
    # indented by 2 more spaces. Opposite gooes for when you close a brace. e.g.
    #
    # $test = [
    #   {
    #     'user'   => 'dylan',
    #     'gruops' => [
    #       'admins',
    #       'users',
    #     ]
    #   }
    # ]
    # Ben: fixed indentation. 
    registry_value { "${regpathuse}\\AutoDetect":
      ensure => 'present',
      type   => 'dword',
      data   => '0',
    }
    #registry_value { "${regpathuse}\IntranetName":
    #  ensure => 'present',
    #  type   => 'dword',
    #  data   => '0',
    #}
    #registry_value { "${regpathuse}\ProxyByPass":
    #  ensure => 'present',
    #  type   => 'dword',
    #  data   => '0',
    #}
    registry_value { "${regpathuse}\\UNCAsIntranet":
      ensure => 'present',
      type   => 'dword',
      data   => '0',
    }
    registry_value { "${regpathuse}\\IEHarden":
      ensure => 'present',
      type   => 'dword',
      data   => '1',
    }
  }
  # Windows Shutdown Event Tracker set
  # Create the key as sometimes its not present on clean builds
  registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability':
    ensure       => 'present',
    purge_values => false,
  }
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonOn':
    ensure => 'present',
    type   => 'dword',
    data   => '1',
  }
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonUI':
    ensure => 'present',
    type   => 'dword',
    data   => '1',
  }

  # TODO: These would run evey time Puppet is run right? Need to find some way to make them idempotent
  # Fixed!!! now tracks the event of the registry key being updated. 
  exec { 'rundllie':
    command     => 'C:\windows\System32\rundll32.exe iesetup.dll,IEHardenUser',
    subscribe   => Registry_value['HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled'],
    refreshonly => 'true',
  }
  exec { 'rundllie2':
    command     => 'C:\windows\System32\rundll32.exe iesetup.dll,IEHardenAdmin',
    subscribe   => Registry_value['HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled'],
    refreshonly => 'true',
  }
  exec { 'rundllie3':
    command     => 'C:\windows\System32\rundll32.exe iesetup.dll,IEHardenMachineNow',
    subscribe   => Registry_value['HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled'],
    refreshonly => 'true',
  }
}
