class profile::pe_master::autosign {
  include autosign
  #class { ::autosign:
  autosign { 'bengsign':
    ensure => 'latest',
    config => {
      'general' => {
        'loglevel' => 'INFO',
        },
    },
  }
}
