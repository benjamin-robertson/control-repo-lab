# Class: profile::windows_applocker_fervid
#
#
class profile::windows_applocker_fervid {
  #include puppet_applocker_fervid
  class { 'puppet_applocker_fervid':
    executable_rules   => 'Audit',
    msi_rules          => 'Enabled',
    dll_rules          => 'Enabled',
    script_rules       => 'Enabled',
    packaged_app_rules => 'Enabled',
  }
}
