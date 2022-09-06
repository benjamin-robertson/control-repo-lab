# Class: profile::windows::demo
#
#
class profile::windows::demo (
  Array $certs,
) {
  # resources
  $certs.each | Integer $index, String $cert | {
    notify {"cert is ${cert}":}
    # dsc_certificateimport { "cert ${index}":
    #   dsc_ensure   => present,
    #   dsc_content  => $cert,
    #   dsc_location => 'LocalMachine',
    # }
  }

  include chocolatey

  package {'firefox':
    ensure   => latest,
    provider => chocolatey,
  }

}
