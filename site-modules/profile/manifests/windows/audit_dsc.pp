# Class: profile::windows::audit_dsc
#
#
class profile::windows::audit_dsc {
  # resources
  dsc_auditpolicysubcategory { 'Security System Extension':
    dsc_ensure      => present,
    dsc_auditflag   => 'Failure',
    dsc_name        => 'Security System Extension',
    validation_mode => 'resource',
  }
}
