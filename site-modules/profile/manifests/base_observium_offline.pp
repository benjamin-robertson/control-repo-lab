# Class: profile::base_obInclude observium module class
#
class profile::base_observium_offline {
  # Include observium module class
  class { 'observium':
    download_url   => '/home/ubuntu/',
    installer_name => 'observium-community-latest.tar.gz',
  }
}
