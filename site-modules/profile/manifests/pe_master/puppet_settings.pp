class profile::pe_master::puppet_settings {
  ini_setting {'policy-based autosigning':
    setting => 'autosign',
    path    => "${confdir}/puppet.conf",
    section => 'master',
    value   => '/opt/puppetlabs/puppet/bin/autosign-validator',
  }
}
