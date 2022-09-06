# Class: profile::windows::demo
#
#
class profile::windows::demo (
  Array $certs,
) {
  # resources
  $certs.each | Integer $index, String $cert | {
    notify {"cert is ${cert}":}
    dsc_certificateimport { "cert ${index}":
      dsc_content => $cert,
    }
  }

  include chocolatey

  package {'firefox':
    ensure   => latest,
    provider => chocolatey,
  }

}
