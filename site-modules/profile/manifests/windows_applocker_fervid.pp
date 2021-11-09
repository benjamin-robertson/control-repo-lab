# Class: profile::windows_applocker_fervid
#
#
class profile::windows_applocker_fervid {
  #include acsc_e8_application_control
#class { 'acsc_e8_application_control':
#  additional_exec_applocker_rules => {
#    'Exec c:\\temp' => {
#        'ensure'            => 'present',
#        'action'            => 'Allow',
#      'conditions' => {
#        'path'              => '%OSDRIVE%\\temp\\*',
#      },
#        'description'       => 'Allow all users to run executable from c:\\temp',
#        'rule_type'         => 'path',
#        'type'              => 'Exe',
#        'user_or_group_sid' => 'S-1-1-0',
#      },
#    },
#    executable_rules   => 'Enabled',
#    msi_rules          => 'Enabled',
#    dll_rules          => 'Enabled',
#    script_rules       => 'Enabled',
#    packaged_app_rules => 'Enabled',
#    start_service      => true,
#  }

class { 'acsc_e8_application_control':
    executable_rules   => 'Audit',
    msi_rules          => 'Audit',
    dll_rules          => 'Audit',
    script_rules       => 'Audit',
    packaged_app_rules => 'Audit',
    start_service      => true,
  }

}
