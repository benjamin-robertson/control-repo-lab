class profile::windows::groups {
  grou p { 'bensgroup':
    ensure  => 'present',
    members => ['ben']
  }
}
