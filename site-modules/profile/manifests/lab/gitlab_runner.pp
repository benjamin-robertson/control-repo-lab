# Class: profile::lab::gitlab_runner
#
# Install gitlab runner
#
class profile::lab::gitlab_runner (
  String $ca_content,
  String $pe_client_tools_download_location = 'https://pm.puppetlabs.com/pe-client-tools/2019.8.10/19.8.11/repos/deb/focal/PC1/pe-client-tools_19.8.11-1focal_amd64.deb',
  Array $pe_servers = ['ip-172-31-28-67.ap-southeast-2.compute.internal'],
) {
  include gitlab_ci_runner

  file {'/etc/ssl/certs/mycoolca.pem':
    content => $ca_content,
  }

  file { '/tmp/pe-client-tools_19.8.11-1focal_amd64.deb':
    source => $pe_client_tools_download_location,
  }

  package {'pe-client-tools':
    ensure   => 'latest',
    source   => '/tmp/pe-client-tools_19.8.11-1focal_amd64.deb',
    provider => 'dpkg',
  }

  $pe_servers.each | Integer $count, String $server | {
    exec {"Download pe certificate ${count}":
      command => "curl https://${$server}:8140/puppet-ca/v1/certificate/ca -k > /home/gitlab-runner/${$server}.pem",
      creates => "/home/gitlab-runner/${$server}.pem",
    }
  }

}
