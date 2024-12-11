# Class: profile::test_exporter
#
#
class profile::test_exporter {
  # resources
  Host <<| tag == 'bens_hosts' |>>

  file { '/tmp/my_hosts':
    ensure => 'file',
  }

  File_line <<| tag == 'test_line' |>>

  $query_results = puppetdb_query('resources { tag = "bens_hosts" }')

  $query_results.each | Hash $results | {
    notify { "Certname is ${results['certname']} IP is ${results['parameters']['ip']}":}
  }

  # notify { "${query_results}": }
}
