# Class: profile::base_linux
#
#
class profile::base_linux {
  noop(undef)
  include profile::linux::motd_linux
  include profile::linux::files
}
