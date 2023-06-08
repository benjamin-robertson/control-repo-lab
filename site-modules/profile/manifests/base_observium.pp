# Class: profile::base_obInclude observium module class
#
class profile::base_observium {
  # Include observium module class
  class { 'observium':
    additional_mib_location => '/blah/hello',
  }
}
