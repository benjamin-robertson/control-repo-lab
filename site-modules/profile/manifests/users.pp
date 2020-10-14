class users {

  user { 'ben':
    ensure => 'present',
    comment => 'bens user account lol',
    roles => 'Adminstrators'
  }

}
