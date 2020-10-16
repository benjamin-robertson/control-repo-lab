class profile::registry {
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\IEHardenIENoWarn':
    ensure => 'present',
    type => 'dword',
    data => '1',
  }
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\IEHarden':
    ensure => 'present',
    type => 'dword',
    data => '1',
  }
}
