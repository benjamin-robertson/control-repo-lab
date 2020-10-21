class profile::windows_classes::registry {
  # TODO: Alignment

  #IE ESC values required
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => 'present',
    type   => 'dword',
    data   => '1',
  }
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => 'present',
    type   => 'dword',
    data   => '1',
  }

  # TODO: Indentation is inconsistent

  # Set the array values for IE ESC
  $regpath = ['HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap','HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap']

  $regpath.each |String $regpathuse| {
  registry_value { "${regpathuse}\AutoDetect":
    ensure => 'present',
    type   => 'dword',
    data   => '0',
  }
  registry_value { "${regpathuse}\IntranetName":
    ensure => 'present',
    type   => 'dword',
    data   => '0',
  }
  registry_value { "${regpathuse}\ProxyByPass":
    ensure => 'present',
    type   => 'dword',
    data   => '0',
  }
  registry_value { "${regpathuse}\UNCAsIntranet":
    ensure => 'present',
    type   => 'dword',
    data   => '0',
  }
  registry_value { "${regpathuse}\IEHarden":
    ensure => 'present',
    type   => 'dword',
    data   => '1',
  }
}
  # Windows Shutdown Event Tracker set
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
  # Ben: Yeah it does, I was being lazy :/
  exec { 'rundllie':
    command => 'C:\windows\System32\rundll32.exe iesetup.dll,IEHardenUser',
  }
  exec { 'rundllie2':
    command => 'C:\windows\System32\rundll32.exe iesetup.dll,IEHardenAdmin',
  }
  exec { 'rundllie3':
    command => 'C:\windows\System32\rundll32.exe iesetup.dll,IEHardenMachineNow',
  }
}
