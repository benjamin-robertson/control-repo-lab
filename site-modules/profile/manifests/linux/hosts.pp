# Class: profile::linux::hosts
#
#
class profile::linux::hosts {
  # Collect all the hosts
  @@host { 'hostname':
    name    => $facts['hostname'],
    ip      => $facts['ipaddress'],
    comment => 'exported resource'
  }
  Host <<| |>>
}
