# Class: profile::linux::hosts
#
#
class profile::linux::hosts {
  # Collect all the hosts
  @@host { $facts['hostname']:
    name    => $facts['fqdn'],
    ip      => $facts['ipaddress'],
    comment => 'exported resource'
  }
  Host <<| |>>
}
