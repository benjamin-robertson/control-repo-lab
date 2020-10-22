class profile::pe_master::autosign{
  autosign { 'manage_autosign':
    ensure => 'latest',
    config => {general => {loglevel => 'INFO'},
  }
}
