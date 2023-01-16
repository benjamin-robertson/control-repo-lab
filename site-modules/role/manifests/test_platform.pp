# Class: role::test_platform
#
#
class role::test_platform {
  class {'platform_module':
    require => Class['soe_linux'],
  }
  include soe_linux
}
