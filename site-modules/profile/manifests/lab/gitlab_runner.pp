# Class: profile::lab::gitlab_runner
#
# Install gitlab runner
#
class profile::lab::gitlab_runner (
  String $ca_content,
  String $pe_client_tools_download_location = 'https://pm.puppetlabs.com/pe-client-tools/2019.8.10/19.8.11/repos/deb/focal/PC1/pe-client-tools_19.8.11-1focal_amd64.deb',
) {
  include gitlab_ci_runner

  file {'/etc/ssl/certs/mycoolca.pem':
    content => $ca_content,
  }

  #file { '/tmp/pe-client-tools_19.8.11-1focal_amd64.deb':
  #  source => $pe_client_tools_download_location,
  #}

  include puppet_enterprise::profile::controller

  #package {'pe-client-tools':
  #  ensure   => 'latest',
  #  source   => '/tmp/pe-client-tools_19.8.11-1focal_amd64.deb',
  #  provider => 'dpkg',
  #}
}
