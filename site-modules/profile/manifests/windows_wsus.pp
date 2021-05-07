# Class: profile::windows_wsus
#
#
class profile::windows_wsus {
  class { 'wsus_client':
    erver_url            => 'http://ip-172-31-14-59.ap-southeast-2.compute.internal:8530',
    enable_status_server => true,
  }
}
