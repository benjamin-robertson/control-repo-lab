class groups {

  group { 'bensgroup':
    ensure => 'present',
    members => ['ben']
  }
}
