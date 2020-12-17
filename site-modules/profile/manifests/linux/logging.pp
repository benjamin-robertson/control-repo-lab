class profile::linux::logging {
  Class { 'rsyslog':
    log_server => ['127.9.9.9'],
  }
}
