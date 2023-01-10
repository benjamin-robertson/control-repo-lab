# Class: role::test_platform
#
#
class role::test_platform {
  contain platform_module
  contain soe_linux

  Class['soe_linux'] -> Class['platform_module']
}
