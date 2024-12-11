# Class: profile::test_collector
#
#
class profile::test_collector {
  # Collect resources

  @@host { $facts['networking']['fqdn']:
    ip           => $facts['networking']['ip'],
    host_aliases => $facts['networking']['hostname'],
    tag          => 'bens_hosts',
  }

  # collect all exported resources and realize them on this host
  # Host <<||>>

  # file { '/tmp/my_hosts':
  #   ensure => 'file',
  # }

  @@file_line { "${facts['networking']['fqdn']}_line":
    ensure => 'present',
    path   => '/tmp/my_hosts',
    match  => "^${facts['networking']['fqdn']}",
    line   => "${facts['networking']['fqdn']} ${facts['networking']['ip']}",
    tag    => 'test_line',
  }
}
