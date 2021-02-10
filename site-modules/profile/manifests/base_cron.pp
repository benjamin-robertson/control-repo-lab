# Class: profile::base_dcron
#
#
class profile::base_cron {
  cron { 'puppet run every 1 minute':
    command => '/opt/puppetlabs/bin/puppet agent -t',
    user    => 'root',
    minute  => '*/1',
  }
