# Class: profile::manage_agent
#
#
class profile::manage_agent {
  ini_setting { 'agent_interval':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'interval',
    value   => '1m',
    notify  => Service['puppet.service'],
  }

  service { 'puppet.service':
    ensure   => 'running',
    enable   => 'true',
    provider => 'systemd',
  }
}
