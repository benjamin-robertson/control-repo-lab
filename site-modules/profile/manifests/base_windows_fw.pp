class profile::base_windows_fw {
  class { 'windows_firewall':
    ensure => 'running',
  }
#  windows_firewall_rule { "puppet - all icmpv4":
#    ensure    => present,
#    direction => 'inbound',
#    action    => 'allow',
#    protocol  => 'icmpv4',
#  }
}
