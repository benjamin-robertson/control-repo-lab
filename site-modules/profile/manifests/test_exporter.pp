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

  notify { "${query_results}": }
}
