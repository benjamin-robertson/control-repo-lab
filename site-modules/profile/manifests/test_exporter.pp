# Class: profile::test_exporter
#
#
class profile::test_exporter {
  # resources

  # This will create all the host entries which were collected in the 'test_collector' class with the tag bens_hosts.
  # Creating them on the host this exporter class is applied too. 
  # Host <<| tag == 'bens_hosts' |>>

  file { '/tmp/my_hosts':
    ensure => 'file',
  }

  # This will populate the file '/tmp/my_hosts' with all the files lines were were collected from the 'test_collector' 
  # class with the tag test_line.
  File_line <<| tag == 'test_line' |>>

  # we can also simply query PuppetDB for exported resources with the tag 'bens_hosts'. This will provide an array containing 
  # hashes of the exported resources. 1 hash per node/resource. 
  $query_results = puppetdb_query('resources { tag = "bens_hosts" }')

  $query_results.each | Hash $results | {
    # We want to check if the resource is exported before printing. Otherwise will also get the resources which have been exported 
    # on the target system.
    if $results['exported'] == true {
      notify { "Certname is ${results['certname']} IP is ${results['parameters']['ip']}": }
    }
  }
}
