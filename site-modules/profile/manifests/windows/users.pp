class profile::windows::users {

  # TODO: Alignment
  user { 'ben':
    ensure  => 'present',
    comment => 'bens user account lol',
    groups  => 'Administrators'
  }

}
