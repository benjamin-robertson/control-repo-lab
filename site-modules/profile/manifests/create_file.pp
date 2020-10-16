class profile::create_file {

  if $facts['osfamily'] == 'windows' {
    file { 'c:\temp':
      ensure => 'directory',
      owner => 'ben',
      group => 'bensgroup',
    }
    #set the ACL on the file
    acl { 'c:\temp':
      permissions => [
        { identity => 'ben', rights => ['full'] },
      ],
    }
  }
}
