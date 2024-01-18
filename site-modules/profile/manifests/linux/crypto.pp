# Class: profile::linux::crypto
#
#
class profile::linux::crypto {
  class { 'crypto_policy':
    ensure => 'DEFAULT',
  }
}
