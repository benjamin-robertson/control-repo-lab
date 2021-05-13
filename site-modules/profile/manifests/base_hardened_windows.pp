# Class: profile::base_hardened_windows
#
#
class profile::base_hardened_windows {
  #include abide_windows
  class { 'abide_windows':
    benchmark => 'cis',
    config    => {
      'level'   => '1',
      'profile' => 'member_server',
    }
  }
}
