# Class: profile::resource_collector
#
# Collect all the resources
#
class profile::resource_collector {

  @@host { $facts['fqdn']:
    ip           => $facts['ipaddress'],
    host_aliases => $facts['hostname'],
  }

  # collect all exported resources and realize them on this host
  Host <<||>>

  resources { 'host':
    purge  => true,
  }

  @host { 'poodle':
    ip           => '1.2.3.4',
    host_aliases => 'poodle',
  }

  realize Host['poodle']

}
