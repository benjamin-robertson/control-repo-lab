class profile::base_windows_fw {
  class { 'windows_firewall':
    ensure => 'running',
  }

  windows_firewall::exception { 'WINRM':
    ensure       => present,
    direction    => 'in',
    action       => 'allow',
    enabled      => true,
    protocol     => 'TCP',
    local_port   => '80',
    remote_port  => 'any',
    display_name => 'HTTP in - puppet',
    description  => 'Inbound rule for HTTP - puppet',
  }
#  windows_firewall_rule { "puppet - all icmpv4":
#    ensure    => present,
#    direction => 'inbound',
#    action    => 'allow',
#    protocol  => 'icmpv4',
#  }
}
