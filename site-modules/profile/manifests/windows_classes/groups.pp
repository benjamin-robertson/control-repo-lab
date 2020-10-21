class profile::windows_classes::groups {
  # TODO: Alignment
  group { 'bensgroup':
    ensure  => 'present',
    members => ['ben']
  }
}
