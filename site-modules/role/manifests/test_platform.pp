# Class: role::test_platform
#
#
class role::test_platform {
  include soe_linux
  class {'platform_module':
    require => Class['soe_linux'],
  }
}
