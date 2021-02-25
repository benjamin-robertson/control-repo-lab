class profile::base_windows_fw {
  windows_firewall_rule { "puppet - all icmpv4":
    ensure    => present,
    direction => 'inbound',
    action    => 'allow',
    protocol  => 'icmpv4',
  }
}
