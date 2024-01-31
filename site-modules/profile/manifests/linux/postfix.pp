# Class: profile::linux::postfix
#
#
class profile::linux::postfix (
  Hash $options = {}
) {
  # create postfix
  class { 'postfix':
    * => $options,
  }

  postfix::hash { '/etc/postfix/.sasl_passwd':
    ensure => present,
    source => 'puppet:///modules/profile/sasl_passwd',
  }
}
