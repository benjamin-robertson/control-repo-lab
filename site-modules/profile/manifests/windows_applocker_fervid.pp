# Class: profile::windows_applocker_fervid
#
#
class profile::windows_applocker_fervid {
  #include puppet_applocker_fervid
  class { 'acsc_e8_application_control':
    executable_rules   => 'Enabled',
    msi_rules          => 'Enabled',
    dll_rules          => 'Enabled',
    script_rules       => 'Enabled',
    packaged_app_rules => 'Enabled',
  }
}
