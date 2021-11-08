# Class: profile::windows_applocker_fervid
#
#
class profile::windows_applocker_fervid {
  #include puppet_applocker_fervid
  class { 'acsc_e8_application_control':
    executable_rules   => 'Enforce',
    msi_rules          => 'Enforce',
    dll_rules          => 'Enforce',
    script_rules       => 'Enforce',
    packaged_app_rules => 'Enforce',
  }
}
