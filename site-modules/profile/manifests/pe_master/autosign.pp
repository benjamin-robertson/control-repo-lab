class profile::pe_master::autosign {
  class { ::autosign:
    ensure => 'latest',
    config => {
      'general' => {
        'loglevel' => 'INFO',
        },
    },
  }
}
