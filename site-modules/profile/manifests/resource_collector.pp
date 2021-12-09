# Class: profile::resource_collector
#
# Collect all the resources
#
class profile::resource_collector {
  notify { 'Collect all the resources':}

  @@host { $facts['fqdn']:
    ip           => $facts['ipaddress'],
    host_aliases => $facts['hostname'],
  }

  # collect all exported resources and realize them on this host
  Host <<||>>
}
