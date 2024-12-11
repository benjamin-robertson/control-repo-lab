# Class: profile::test_collector
#
#
class profile::test_collector {
  # Collect resources

  @@host { $facts['network']['fqdn']:
    ip           => $facts['network']['ip'],
    host_aliases => $facts['network']['hostname'],
  }

  # collect all exported resources and realize them on this host
  Host <<||>>
}
