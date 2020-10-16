class profile::registry {
  registry_value { 'poodle':
    ensure => 'present',
    path => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap',
    type => 'dword',
    data => '1234',
  }
}
