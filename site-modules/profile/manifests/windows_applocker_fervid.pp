# Class: profile::windows_applocker_fervid
#
#
class profile::windows_applocker_fervid {
  #include puppet_applocker_fervid
  class { 'acsc_e8_application_control':
    executable_rules   => 'Audit',
    msi_rules          => 'Audit',
    dll_rules          => 'Audit',
    script_rules       => 'Audit',
    packaged_app_rules => 'Audit',
  }
}
