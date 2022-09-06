class profile::windows::groups {
  group { 'bensgroup':
    ensure  => 'present',
    members => ['ben']
  }
}
