class profile::groups {
  # TODO: Alignment
  group { 'bensgroup':
    ensure  => 'present',
    members => ['ben']
  }
}
