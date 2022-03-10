# Class: profile::lab::snmp_v3 (
#
#
class profile::lab::snmp_v3 (
  Hash $v3_users,
) {
  include snmp

  $v3_users.each | String $name, Hash $user | {
    snmp::snmpv3_user { $name:
      * => $user,
    }
  }

}
