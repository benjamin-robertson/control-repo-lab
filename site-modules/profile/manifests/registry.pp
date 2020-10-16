class profile::registry {
  registry_value { 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\poodle':
    ensure => 'present',
    type => 'dword',
    data => '1234',
  }
}
