class profile::registry {
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\poodle':
    ensure => 'present',
    type => 'dword',
    data => '1234',
  }
}
