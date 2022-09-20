# Class: profile::windows::audit_dsc
#
#
class profile::windows::audit_dsc {
  # resources
  dsc_auditpolicysubcategory { 'Security System Extension Failure':
    dsc_ensure      => 'Present',
    dsc_auditflag   => 'Failure',
    dsc_name        => 'Security System Extension',
    validation_mode => 'resource',
  }

  dsc_auditpolicysubcategory { 'Security System Extension Success':
    dsc_ensure      => 'Present',
    dsc_auditflag   => 'Success',
    dsc_name        => 'Security System Extension',
    validation_mode => 'resource',
  }

  dsc_auditpolicysubcategory { 'Logon C1.2.3':
    dsc_ensure      => 'Present',
    dsc_auditflag   => 'Success',
    dsc_name        => 'Logon',
    validation_mode => 'resource',
  }
  dsc_auditpolicysubcategory { 'Logon failure':
    dsc_ensure      => 'Absent',
    dsc_auditflag   => 'Failure',
    dsc_name        => 'Logon',
    validation_mode => 'resource',
  }
}
