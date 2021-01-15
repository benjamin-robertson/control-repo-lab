# Class: profile::base_obInclude observium module class
#
class profile::base_observium_offline {
  # Include observium module class
class { 'observium':
    manage_fw     => false,
    manage_apache => false,
}
}
