class profile::registry {
  registry_value { 'HKU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\poodle':
    ensure => 'present',
    type => 'reg_dword',
    data => '1234',
  }
}
