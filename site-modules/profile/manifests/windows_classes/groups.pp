class profile::windows_classes::groups {
  group { 'bensgroup':
    ensure  => 'present',
    members => ['ben']
  }
}
