class profile::linux::logging {
  class { 'rsyslog':
    log_servers => ['127.9.9.9'],
  }
}
