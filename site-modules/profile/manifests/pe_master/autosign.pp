class profile::pe_master::autosign {
  class { '::autosign':
    ensure => 'latest',
    config => {
      'general' => {
        'loglevel' => 'INFO',
        },
      'jwt_token' => {
        'secret'   => 'hunter2',
        'validity' => '7200',
      }
    },
  }
}
