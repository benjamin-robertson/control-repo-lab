# Class: profile::lab::gitlab_runner
#
# Install gitlab runner
#
class profile::lab::gitlab_runner (
  String $ca_content,
  String $pe_client_tools_download_location = 'https://pm.puppetlabs.com/pe-client-tools/2019.8.10/19.8.11/repos/deb/focal/PC1/pe-client-tools_19.8.11-1focal_amd64.deb',
  Array $pe_servers = ['ip-172-31-28-67.ap-southeast-2.compute.internal'],
  String $save_location = '/tmp',
) {
  # add run stage for proxy setup
  stage { 'first':
    before => Stage['main'],
  }
  class {'profile::lab::proxy_setup':
    stage => 'first',
  }
  reboot { 'after first run stage':
    subscribe       => Class['profile::lab::proxy_setup'],
  }

  # setup proxy for test
  contain gitlab_ci_runner

  #class { '::realmd':
  #  domain               => 'example.com',
  #  domain_join_user     => 'user',
  #  domain_join_password => 'password',
  #}

  #contain comply
  #Exec['apt_update'] -> Class['comply']
  #class { 'comply':
  #  scanner_source => 'https://ec2-54-79-56-92.ap-southeast-2.compute.amazonaws.com:30303/assessor',
    #require        => Exec['apt_update'],
  #}

  archive { 'test gitlabgpg':
    ensure       => present,
    extract      => false,
    source       => 'https://packages.gitlab.com/runner/gitlab-runner/gpgkey',
    path         => '/tmp/gitlab.gpg',
    proxy_server => 'http://ip-172-31-11-63.ap-southeast-2.compute.internal:3128',
    proxy_type   => 'http',
  }

  # download docker gpg
  file { 'docker pgp':
    path   => '/tmp/docker.gpg',
    source => $docker::params::package_ce_key_source,
    before => Class['gitlab_ci_runner'],
  }

  file {'/etc/ssl/certs/mycoolca.pem':
    content => $ca_content,
  }

  file { "${$save_location}/pe-client-tools_19.8.11-1focal_amd64.deb":
    source => $pe_client_tools_download_location,
  }

  package {'pe-client-tools':
    ensure   => 'latest',
    source   => "${$save_location}/pe-client-tools_19.8.11-1focal_amd64.deb",
    provider => 'dpkg',
  }

  $pe_servers.each | Integer $count, String $server | {
    exec {"Download pe certificate ${count}":
      command => "/usr/bin/curl https://${$server}:8140/puppet-ca/v1/certificate/ca -k > ${$save_location}/${$server}.pem",
      creates => "${$save_location}/${$server}.pem",
    }
  }

  Class['apt'] -> Class['apt::update'] -> Package <| provider == 'apt' |>

}
