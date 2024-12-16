# Class: profile::misp
#
#
class profile::misp {
  # Install docker compose
  class { 'docker::compose':
    ensure => present,
  }

  include docker

  file { '/opt/misp':
    ensure => directory,
  }

  vcsrepo { '/opt/misp':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/MISP/misp-docker.git',
    revision => '9bb03eab0ac1ac442e73820328033983dee1f1d4',
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
  }
}
