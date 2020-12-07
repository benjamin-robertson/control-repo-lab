class profile::linux::logging {
  class { 'rsyslog':
    log_server => ['127.9.9.9'],
  }
}
