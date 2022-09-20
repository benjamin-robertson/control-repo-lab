# Class: profile::manage_agent
#
#
class profile::manage_agent (
  String $interval = '1m',
) {
  ini_setting { 'agent_interval':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'runinterval',
    value   => $interval,
    notify  => Service['puppet.service'],
  }

  service { 'puppet.service':
    ensure   => 'running',
    enable   => 'true',
    provider => 'systemd',
  }
}
