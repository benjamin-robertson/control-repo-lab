# Class: profile::base_linux
#
#
class profile::base_linux {
  include profile::linux::motd_linux
  include profile::linux::files
  include soe_linux

  class { 'auditd':
    default_audit_profiles => 'simp',
  }

  file { '/tmp/random.txt':
    ensure  => file,
    content => 'so random. added extra',
  }
}
