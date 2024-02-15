# Class: profile::base_linux
#
# @param blah Not a real parameter
#
class profile::base_linux (
  String $blah,
) {
  include profile::linux::motd_linux
  include profile::linux::files
  include soe_linux

  class { 'auditd':
    default_audit_profiles => ['simp'],
    purge_auditd_rules     => false,
  }

  file { '/tmp/random.txt':
    ensure  => file,
    content => 'so random. added extra',
  }
}
