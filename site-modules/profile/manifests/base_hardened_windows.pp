# Class: profile::base_hardened_windows
#
#
class profile::base_hardened_windows {
  include cem_windows

  # Permit RDP inbound
  windows_firewall::exception { 'Remote desktop':
    ensure       => present,
    direction    => 'in',
    action       => 'allow',
    enabled      => true,
    protocol     => 'TCP',
    local_port   => 3389,
    remote_port  => 'any',
    display_name => 'Remote desktop',
    description  => 'Permit remote desktop',
  }

  registry_value { 'HKLM\\SOFTWARE\\Puppet Labs\\Puppet\\SetInGPO':
    ensure => present,
    type   => string,
    data   => 'Set in Puppet, FIGHT!!',
  }
}
