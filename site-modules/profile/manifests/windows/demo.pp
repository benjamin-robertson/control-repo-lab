# Class: profile::windows::demo
#
#
class profile::windows::demo (
  Array $certs,
) {
  # resources
  $certs.each | Integer $index, Hash $cert | {
    notify {"cert is ${cert}":}
    dsc_certificateimport { "cert ${index}":
      dsc_ensure     => present,
      dsc_content    => $cert['cert'],
      dsc_location   => 'LocalMachine',
      dsc_thumbprint => $cert['thumb'],
    }
  }

  include chocolatey

  package {'firefox':
    ensure   => latest,
    provider => chocolatey,
  }

}
