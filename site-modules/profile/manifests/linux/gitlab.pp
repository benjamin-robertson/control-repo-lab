# Class: profile::linux::gitlab
#
#
class profile::linux::gitlab {
  # install gitlab ee
  class { 'gitlab':
    external_url            => 'https://ec2-3-25-233-142.ap-southeast-2.compute.amazonaws.com',
    manage_upstream_edition => 'ee',
  }
}
