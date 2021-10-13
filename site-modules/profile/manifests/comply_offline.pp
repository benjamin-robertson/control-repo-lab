# Class: profile::base_chocolatey
#
#
class profile::comply_offline (
  String $scanner_source,
  String $chocolately_package_dest = 'c:\\choco_packages\\',
  String $chocolatey_download_url = 'http://ip-172-31-4-194.ap-southeast-2.compute.internal/chocolatey.0.11.2.nupkg',
  String $choco_http_source = 'http://ip-172-31-4-194.ap-southeast-2.compute.internal/choco/',
  String $java_msi_name = 'adoptopenjdk8jre.8.292.10.nupkg',
  Array $packges_to_sync = ['Wget.1.21.2.nupkg','adoptopenjdk8jre.8.292.10.nupkg'],
) {
  # Setup chocolatey
  class { 'chocolatey':
    chocolatey_download_url => $chocolatey_download_url,
  }

  chocolateysource {'internal':
    ensure   => present,
    location => $chocolately_package_dest,
    priority => 1,
  }

  chocolateysource {'chocolatey':
    ensure   => disabled,
  }

  # Sync chocolatey packages locally
  file { 'choco_packages_dir':
    ensure => directory,
    path   => $chocolately_package_dest,
  }

  $packges_to_sync.each | String $package | {
    file { $package:
      ensure  => file,
      source  => "${choco_http_source}${package}",
      path    => "${chocolately_package_dest}\\${package}",
      require => File['choco_packages_dir'],
    }
  }

  # Sync java msi locally
  file { $java_msi_name:
    ensure  => file,
    source  => "${choco_http_source}${java_msi_name}",
    path    => "${chocolately_package_dest}\\${java_msi_name}",
    require => File['choco_packages_dir'],
  }

  # Install java
  package { 'Install java jre':
    ensure   => 'present',
    provider => 'windows',
    source   => "${chocolately_package_dest}\\${java_msi_name}",
    require  => File[$java_msi_name]
  }

  # Install comply scanner
  class {'comply':
    manage_chocolatey => false,
    manage_java       => false,
    scanner_source    => $scanner_source,
  }
}
