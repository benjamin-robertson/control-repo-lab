# Class: profile::windows::demo
#
#
class profile::windows::demo (
  Array $certs,
) {
  # resources
  $certs.each | Integer $index, String $cert | {
    dsc_certificateimport { "cert ${index}":
      dsc_content => $cert,
    }
  }

  include chocolatey

  package {'chrome':
    ensure   => latest,
    provider => chocolatey,
  }

}
