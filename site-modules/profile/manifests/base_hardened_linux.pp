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
  file_line { 'remove_old_time_server':
    ensure            => 'absent',
    path              => '/etc/chrony/chrony.conf',
    match             => '^pool ',
    match_for_absence => true,
  }
  file_line { 'remove_old_time_server':
    ensure            => 'absent',
    path              => '/etc/chrony/chrony.conf',
    match             => '^server ',
    match_for_absence => true,
  }
}
