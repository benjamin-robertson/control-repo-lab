# Class: profile::base_obInclude observium module class
#
class profile::base_observium {
  # Include observium module class
  include observium
  # class { 'observium':
  #   additional_mib_location      => ['/blah/hello','/ho/ho'],
  #   additional_snmp_conf_options => ['extra','stuff'],
  # }
}
