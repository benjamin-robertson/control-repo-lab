# Class: profile::proxy_server
#
#
class profile::linux::proxy_server {
  class { 'squid': }

  squid::acl { 'Safe_ports':
    type    => port,
    entries => ['80'],
  }

  squid::http_access { 'Safe_ports':
    action => allow,
  }

  squid::http_access { '!Safe_ports':
    action => deny,
  }
}
