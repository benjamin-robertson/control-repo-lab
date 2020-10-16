class profile::create_file {

  if $facts['osfamily'] == 'windows' {
    file { 'c:\temp':
      ensure => 'directory',
      owner => 'ben',
    }
  }
}
