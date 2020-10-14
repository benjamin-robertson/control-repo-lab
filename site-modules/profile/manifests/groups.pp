class profile::groups {

  group { 'bensgroup':
    ensure => 'present',
    members => ['ben']
  }
}
