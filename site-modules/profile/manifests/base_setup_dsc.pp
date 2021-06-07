# Class: profile::base_setup_dsc
#
#
class profile::base_setup_dsc (
  Array $packages,
)
{
  include chocolatey
  package { $packages:
    ensure   => 'latest',
    provider => 'chocolatey'
  }
}
