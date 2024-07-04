# Class: profile::log4j
#
#
class profile::log4j {
  # resources
  notify { "${profile::ip_even($facts['networking']['ip'])}": }

  if profile::ip_even($facts['networking']['ip']) {
    file { '/opt/opennms':
      ensure => directory,
    }

    # even IP we will install Opennms
    archive { '/opt/opennms/lib':
      ensure       => present,
      creates      => '/opt/opennms/lib',
      source       => 'https://github.com/OpenNMS/opennms/releases/download/opennms-29.0.8-1/opennms-29.0.8.tar.gz',
      extract_path => '/opt/opennms',
      extract      => true,
    }
  }
}
