class profile::registry {
  registry_value { 'poodle':
    ensure => 'present',
    path => 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap',
    type => 'dword',
    data => '1234',
  }
}
