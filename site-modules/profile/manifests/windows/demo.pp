# Class: profile::windows::demo
#
#
class profile::windows::demo (
  Array $certs,
) {
  # resources
  file {"c:\\certs\\":
    ensure => directory,
  }

  $certs.each | Integer $index, Hash $cert | {
    file {"c:\\certs\\cert${index}":
      ensure  => file,
      content => $cert['cert'],
    }
    dsc_certificateimport { "cert ${index}":
      dsc_ensure      => 'Present',
      dsc_path        => "c:\\certs\\cert${index}",
      dsc_location    => 'LocalMachine',
      dsc_thumbprint  => $cert['thumb'],
      dsc_store       => 'Root',
      validation_mode => 'resource',
    }
  }

  dsc_timezone {'AUS Eastern Standard Time':
    dsc_timezone         => 'AUS Eastern Standard Time',
    dsc_issingleinstance => 'Yes',
  }

  include chocolatey

  package {'firefox':
    ensure   => latest,
    provider => chocolatey,
  }

}
