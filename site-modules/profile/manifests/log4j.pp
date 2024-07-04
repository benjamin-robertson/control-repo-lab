# Class: profile::log4j
#
#
class profile::log4j {
  # resources

  if profile::ip_even($facts['networking']['ip']) {
    case $facts['kernel'] {
      'Linux': {
        file { '/opt/opennms':
          ensure => directory,
        }

        file { '/opt/opennms27':
          ensure => directory,
        }

        # even IP we will install Opennms
        archive { '/opt/opennms/opennms-29.0.8.tar.gz':
          ensure       => present,
          creates      => '/opt/opennms/lib',
          source       => 'https://github.com/OpenNMS/opennms/releases/download/opennms-29.0.8-1/opennms-29.0.8.tar.gz',
          extract_path => '/opt/opennms',
          extract      => true,
        }

        archive { '/opt/opennms27/opennms-27.0.2-source.tar.gz':
          ensure       => present,
          creates      => '/opt/opennms27/lib',
          source       => 'https://github.com/OpenNMS/opennms/releases/download/opennms-27.0.2-1/opennms-27.0.2-source.tar.gz',
          extract_path => '/opt/opennms27',
          extract      => true,
        }
      }
      'windows': {
        class { 'chocolatey':
          before => Class['archive'],
        }
        include archive
        file { 'c:\\opennms':
          ensure => directory,
        }

        file { 'c:\\opennms27':
          ensure => directory,
        }

        archive { 'c:\\opennms\\opennms-29.0.8.tar.gz':
          ensure       => present,
          creates      => 'c:\\opennms\\lib',
          source       => 'https://github.com/OpenNMS/opennms/releases/download/opennms-29.0.8-1/opennms-29.0.8.tar.gz',
          extract_path => 'c:\\opennms',
          extract      => true,
          require      => Class['archive'],
        }

        archive { 'c:\\opennms27\\opennms-27.0.2-source.tar.gz':
          ensure       => present,
          creates      => 'c:\\opennms27\\lib',
          source       => 'https://github.com/OpenNMS/opennms/releases/download/opennms-27.0.2-1/opennms-27.0.2-source.tar.gz',
          extract_path => 'c:\\opennms27',
          extract      => true,
          require      => Class['archive'],
        }

        exec { 'Extract tar':
          command => 'C:\\Windows\\system32\\tar.exe -xf c:\\opennms\\opennms-29.0.8.tar',
          creates => 'c:\\opennms\\lib',
          path    => 'C:\\opennms',
          require => Archive['c:\\opennms\\opennms-29.0.8.tar.gz'],
        }

        exec { 'Extract tar 27':
          command => 'C:\\Windows\\system32\\tar.exe -xf c:\\opennms27\\opennms-27.0.2-source.tar',
          creates => 'c:\\opennms27\\lib',
          path    => 'C:\\opennms27',
          require => Archive['c:\\opennms27\\opennms-27.0.2-source.tar.gz'],
        }

        user { 'tempadmin':
          ensure   => present,
          groups   => 'Administrators',
          password => 'B@dPassw0rd',
        }
      }
      default: {
        fail('Not supported')
      }
    }
  }
}
