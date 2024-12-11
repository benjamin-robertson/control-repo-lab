# Class: profile::test_exporter
#
#
class profile::test_exporter {
  # resources
  Host <<| tag == 'bens_hosts' |>>

  $query_results = puppetdb_query('["from", "nodes", ["=", ["fact", "os", "family"], "Debian"]]')

  notify { "${query_results}": }
}
