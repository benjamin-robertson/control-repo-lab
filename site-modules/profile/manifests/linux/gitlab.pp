# Class: profile::linux::gitlab
#
#
class profile::linux::gitlab {
  # install gitlab ee
  class { 'gitlab':
    external_url            => "https://${facts['fqdn']}",
    manage_upstream_edition => 'ee',
  }
}
