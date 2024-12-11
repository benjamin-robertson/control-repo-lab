# Class: profile::test_collector
#
#
class profile::test_collector {
  # Collect resources

  # we are able to collect host entries. This can be done for any resource. 
  #This will NOT create the host entry on this host this code is applied too. It will simply collect the data in PuppetDB.
  @@host { $facts['networking']['fqdn']:
    ip           => $facts['networking']['ip'],
    host_aliases => $facts['networking']['hostname'],
    tag          => 'bens_hosts',
  }

  # we are also able to collect defined types. This will not create a line in this file. Simply collect the data in PuppetDB. 
  # We SHOULD tag all the resource we want to collect with a tag for use later. If we don't tag we run the risk
  # of getting additional resources if they are also not tagged.
  @@file_line { "${facts['networking']['fqdn']}_line":
    ensure => 'present',
    path   => '/tmp/my_hosts',
    match  => "^${facts['networking']['fqdn']}",
    line   => "${facts['networking']['fqdn']} ${facts['networking']['ip']}",
    tag    => 'test_line',
  }
}
