# Class: profile::base_dsc_test
#
#
class profile::base_dsc_test {
  # I'm going to test some dsc stuff here

  # First with exsiting DSC modules, I want to see if it will always make corrective change.

  dsc_accountpolicy { 'enforce password history':
    dsc_name                     => 'enforce password history',
    dsc_enforce_password_history => 6,
    validation_mode              => 'resource',
  }
}
