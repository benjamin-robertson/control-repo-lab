# Class: profile::test_collector
#
#
class profile::test_collector {
  # Collect resources

  @@host { $facts['networking']['fqdn']:
    ip           => $facts['networking']['ip'],
    host_aliases => $facts['networking']['hostname'],
  }

  # collect all exported resources and realize them on this host
  Host <<||>>
}
