# Class: profile::base_chocolatey
#
#
class profile::base_chocolatey (
  String $chocolately_package_source = 'http://ip-172-31-4-194.ap-southeast-2.compute.internal/',
  String $chocolatey_download_url = 'http://ip-172-31-4-194.ap-southeast-2.compute.internal/chocolatey.0.11.2.nupkg',
) {

  class { 'chocolatey':
    chocolatey_download_url => $chocolatey_download_url,
  }

  chocolateysource {'sourcename':
    ensure   => present,
    location => $chocolately_package_source,
}
}
