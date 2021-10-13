# Class: profile::base_chocolatey
#
#
class profile::base_chocolatey (
  String $chocolately_package_source = 'c:\\choco_packages\\',
  String $chocolatey_download_url = 'http://ip-172-31-4-194.ap-southeast-2.compute.internal/chocolatey.0.11.2.nupkg',
  String $choco_http_source = 'http://ip-172-31-4-194.ap-southeast-2.compute.internal/choco/',
  Array $packges_to_sync = ['Wget.1.21.2.nupkg','adoptopenjdk8jre.8.292.10.nupkg'],
) {

  class { 'chocolatey':
    chocolatey_download_url => $chocolatey_download_url,
  }

  chocolateysource {'internal':
    ensure   => present,
    location => $chocolately_package_source,
    priority => 1,
  }

  chocolateysource {'chocolatey':
    ensure   => disabled,
  }

  file { 'choco_packages_dir':
    ensure => directory,
  }

  $packges_to_sync.each | String $package | {
    file { $package:
      ensure  => file,
      source  => "${choco_http_source}${package}",
      path    => $chocolately_package_source,
      require => File['choco_packages_dir'],
    }
  }
}
