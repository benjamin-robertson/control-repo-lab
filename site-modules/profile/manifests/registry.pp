class profile::registry {
  registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\IEHarden':
    ensure => 'present',
    type => 'dword',
    data => '1',
  }
  registry_value { 'HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\IEHarden':
    ensure => 'present',
    type => 'dword',
    data => '1',
  }
}
