class profile::create_file {

  case $facts['osfamily'] {
    'windows': {
      file { 'c:\temp':
        ensure => 'directory',
    }
  }
  default: {
    fail('Not a windows hosts')
  }

}
