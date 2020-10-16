class profile::registry {
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => 'present',
    type => 'dword',
    data => '1',
  }
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => 'present',
    type => 'dword',
    data => '1',
  }

#Set the array values
$regpath = ['HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap','HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap']

$regpath.each |String $regpathuse| {
  registry_value { 'AutoDetect':
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { 'IntranetName':
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { 'ProxyByPass':
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { 'UNCAsIntranet':
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { 'IEHarden':
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '1',
  }
}
}
