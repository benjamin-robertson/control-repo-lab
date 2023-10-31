# Class: profile::base_linux
#
#
class profile::base_linux {
  include profile::linux::motd_linux
  include profile::linux::files
  include soe_linux

  file { '/tmp/random.txt':
    ensure  => file,
    content => 'so random',
  }
}
