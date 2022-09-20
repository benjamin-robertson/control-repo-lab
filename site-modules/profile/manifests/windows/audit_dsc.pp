# Class: profile::windows::audit_dsc
#
#
class profile::windows::audit_dsc {
  # resources
  dsc_auditpolicysubcategory { 'Security System Extension':
    #ensure          => present,
    dsc_ensure      => 'Present',
    dsc_auditflag   => 'Failure',
    dsc_name        => 'Security System Extension',
    validation_mode => 'resource',
  }
}
