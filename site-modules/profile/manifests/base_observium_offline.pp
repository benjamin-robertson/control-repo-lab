# Class: profile::base_obInclude observium module class
#
class profile::base_observium_offline {
  # Include observium module class
class { 'observium':
    manage_ssl      => true,
    custom_ssl_cert => '/opt/observium/ssl/cert.pem',
    custom_ssl_key  => '/opt/observium/ssl/key.pem',
}
}
