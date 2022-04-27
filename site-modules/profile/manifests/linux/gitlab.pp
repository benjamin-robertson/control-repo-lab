# Class: profile::linux::gitlab
#
#
class profile::linux::gitlab {
  # install gitlab ee

  notify { $facts['ec2-metadata']:}

  # class { 'gitlab':
  #   external_url            => "https://${facts['ec2-metadata']['public-hostname']}",
  #   manage_upstream_edition => 'ee',
  # }
}
