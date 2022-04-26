# Class: profile::linux::snmp
#
#
class profile::linux::snmp {
  snmp::snmpv3_user { 'myuser':
    authpass => '1234auth',
    privpass => '5678priv',
  }
  class { 'snmp':
    snmpd_config => [ 'rouser myuser authPriv' ],
  }
}
