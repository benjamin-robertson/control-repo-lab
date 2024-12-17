# Class: profile::misp
#
# @param docker_token token for dockerhub
#
class profile::misp (
  Sensitive $docker_token,
) {
  # Install docker compose
  class { 'docker::compose':
    ensure => present,
  }

  include docker

  file { '/opt/misp':
    ensure => directory,
  }

  file { '/opt/tmp':
    ensure => directory,
  }

  vcsrepo { '/opt/misp':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/benjamin-robertson/misp-docker.git',
    revision => '65eb813a8a37c455e4014da9bceddc5ec0c54324',
    excludes => [
      './configs',
      './files',
      './gnupg',
      './logs',
      './ssl',
      'dog',
    '.env'],
    force    => true,
  }

  # setup config file
  file { '/opt/misp/.env':
    ensure  => file,
    content => epp('profile/misp/env'),
    notify  => Docker_compose['misp'],
    require => Vcsrepo['/opt/misp'],
  }

  apt::source { 'docker':
    comment  => 'Docker',
    location => 'https://download.docker.com/linux/ubuntu',
    repos    => 'stable',
    notify   => Exec['apt_update'],
    key      => {
      'name'   => 'docker-archive-keyring.asc',
      'source' => 'https://download.docker.com/linux/ubuntu/gpg',
    },
    before   => Class['docker'],
  }

  docker_compose { 'misp':
    ensure        => present,
    compose_files => ['/opt/misp/docker-compose.yml'],
    tmpdir        => '/opt/tmp',
  }

  # docker::registry { 'https://registry-1.docker.io/v2/':
  #   ensure   => present,
  #   username => 'benrobertson9876',
  #   password => $docker_token.unwrap,
  # }
}
