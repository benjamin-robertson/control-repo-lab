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
  notify {"${$regpathuse}\AutoDetect":}
  registry_value { "${$regpathuse}\AutoDetect":
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { "${$regpathuse}\IntranetName":
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { "${$regpathuse}\ProxyByPass":
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { "${$regpathuse}\UNCAsIntranet":
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '0',
  }
  registry_value { "${$regpathuse}\IEHarden":
    path => $regpathuse,
    ensure => 'present',
    type => 'dword',
    data => '1',
  }
}
}
