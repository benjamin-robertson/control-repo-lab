# Class: role::test_platform
#
#
class role::test_platform {
  include platform_module
  include soe_linux

  Class['soe_linux'] -> Class['platform_module']
}
