# Class: profile::base_linux
#
#
class profile::base_linux {
  noop(false)
  include profile::linux::motd_linux
  include profile::linux::files
}
