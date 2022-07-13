# Class: profile::linux::lvm
#
#
class profile::linux::lvm {
  include lvm

  file { '/mnt/test1':
    ensure => directory,
  }
  file { '/mnt/test2':
    ensure => directory,
  }
}
