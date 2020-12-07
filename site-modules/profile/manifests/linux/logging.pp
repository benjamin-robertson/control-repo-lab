class profile::linux::logging {
  Class { 'rsyslog':
    config_path => '/etc/rsyslog.conf',
    #log_server => ['127.9.9.9'],
  }
}
