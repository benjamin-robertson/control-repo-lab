# Class: profile::lab::proxy_setup
#
# Setup proxy for testing
# 
class profile::lab::proxy_setup (
  Array[Hash] $agent_config,
) {

  $proxy_file = @(EOT)
     export http_proxy='http://172.31.11.63:3128/'
     export https_proxy='http://172.31.11.63:3128/'
     export no_proxy='ip-172-31-28-67.ap-southeast-2.compute.internal'
     | EOT

  $agent_config.each | Integer $index, Hash $config,  | {
    ini_setting { "puppet.conf${index}":
      ensure            => present,
      section           => $config['section'],
      key_val_separator => '=',
      path              => '/etc/puppetlabs/puppet/puppet.conf',
      setting           => $config['setting'],
      value             => $config['value'],
    }
  }

  file {'/etc/profile.d/http_proxy.sh':
    path    => '/etc/profile.d/http_proxy.sh',
    content => $proxy_file,
  }

  #file { 'test file':
  #  path   => '/tmp/myfile.txt',
  #  source => 'http://ip-172-31-11-63.ap-southeast-2.compute.internal/myfile.txt',
  #}
  #file { 'deb file':
  #  path   => '/tmp/amazon-ssm-agent.deb',
  #  source => 'http://ip-172-31-11-63.ap-southeast-2.compute.internal/amazon-ssm-agent.deb',
  #}
}