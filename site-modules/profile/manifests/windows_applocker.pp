# Class: profile::windows_applocker_fervid
#
#
class profile::windows_applocker {
  # include acsc_e8_application_control
  # resources { 'applocker_rule':
  #   purge => true,
  # }

  # include applocker
  # class { 'acsc_e8_application_control':
  #   additional_exec_applocker_rules => {
  #     'Exec c:\\temp'    => {
  #         'ensure'            => 'absent',
  #         'action'            => 'Allow',
  #         'conditions'        => {
  #           'path'              => '%OSDRIVE%\\temp\\*',
  #         },
  #         'description'       => 'Allow all users to run executable from c:\\temp',
  #         'rule_type'         => 'path',
  #         'type'              => 'Exe',
  #         'user_or_group_sid' => 'S-1-1-0',
  #       },
  #     },
  #     executable_rules   => 'Audit',
  #     msi_rules          => 'Audit',
  #     dll_rules          => 'Audit',
  #     script_rules       => 'Audit',
  #     packaged_app_rules => 'Audit',
  #     start_service      => true,
  # }

  class { 'acsc_e8_application_control':
    executable_rules   => 'AuditOnly',
    msi_rules          => 'AuditOnly',
    dll_rules          => 'AuditOnly',
    script_rules       => 'AuditOnly',
    packaged_app_rules => 'AuditOnly',
    start_service      => true,
  }

}
