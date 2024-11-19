# Class: profile::hardened_linux
#
#
class profile::base_hardened_linux {
  file { '/etc/chrony/sources.d':
    ensure => directory,
  }
  file { '/etc/chrony/sources.d/sce_chrony.sources':
    ensure => file,
  }
  include sce_linux
  # include ssh
  file_line { 'listen_address':
    path   => '/etc/ssh/sshd_config',
    line   => "ListenAddress ${facts['networking']['ip']}",
    match  => '^ListenAdddress ',
    notify => Exec['sce_reload_sshd'], # reload in the sce file
  }
  file_line { 'remove_old_time_pool':
    ensure            => 'absent',
    path              => '/etc/chrony/chrony.conf',
    match             => '^pool ',
    multiple          => true,
    match_for_absence => true,
  }
  file_line { 'remove_old_time_server':
    ensure            => 'absent',
    path              => '/etc/chrony/chrony.conf',
    match             => '^server ',
    multiple          => true,
    match_for_absence => true,
  }

  sce_linux::utils::packages::linux::sudo::user_group { 'FULL_SUDO':
    user_group   => 'FULL_SUDO',
    host         => 'ALL',
    target_users => ['ALL'],
    priority     => 15,
    commands     => ['ALL'],
    file_name    => 'FULL_SUDO',
  }
}
