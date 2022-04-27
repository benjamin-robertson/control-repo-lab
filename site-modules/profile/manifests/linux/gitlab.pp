# Class: profile::linux::gitlab
#
#
class profile::linux::gitlab {
  # install gitlab ee

  notify { "This is ec2 ${facts['ec2-metadata']}":}

  # class { 'gitlab':
  #   external_url            => "https://${facts['ec2-metadata']['public-hostname']}",
  #   manage_upstream_edition => 'ee',
  # }
}
