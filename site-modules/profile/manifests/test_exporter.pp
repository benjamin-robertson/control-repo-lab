# Class: profile::test_exporter
#
#
class profile::test_exporter {
  # resources
  Host <<| tag == 'bens_hosts' |>>

  $query_results = puppetdb_query('resources { tag = "bens_hosts" }')

  notify { "${query_results}": }
}
