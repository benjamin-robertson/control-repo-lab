# Class: role::acsc_appwhitelisting
#
#
class role::acsc_appwhitelisting {
  class { 'acsc_e8_application_control':
    executable_rules => 'Enabled',
  }
}
