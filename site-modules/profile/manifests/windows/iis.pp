class profile::windows::iis (
  String $testing = 'Set as class default',
  String $notencrypted = 'Class default',
  String $encrypted = 'Class detault',
)
{

  #$website = "<HTML><HEAD><TITLE>Ben's super really cool website</TITLE></HEAD><BODY><h1>Welcome to ben's pretty cool website</h1><br/><p>This website is hosted on IIS, pretty basic, however its been configured and all setup via Puppet. No manual intervention required, repeatable and automated :) </p></BODY></HTML>"

  # install IIS feature
  dsc_xwindowsfeature {'IIS':
    dsc_ensure => 'Present',
    dsc_name   => 'Web-Server',
  }
  dsc_xwindowsfeature {'IIS-tools':
    dsc_ensure => 'Present',
    dsc_name   => 'Web-Mgmt-Tools',
  }
  dsc_xwindowsfeature {'IIS-tools-scripts':
    dsc_ensure => 'Present',
    dsc_name   => 'Web-Scripting-Tools',
  }
  # remove default website
  iis_site {'Default Web Site':
    ensure  => absent,
  }
  # create folder and html page to serve
  file {'c:\inetpub\bensite':
    ensure => 'directory',
    owner  => 'system',
  }
  # TODO: Does this need to be a template? Given the file is static and doesn't have any
  # interpolated variables in it, is there a simpler way to do this?
  # Ben: changed to source file
  # content => template('profile/index.epp'),
  file {'c:\inetpub\bensite\index.html':
    ensure => 'file',
    source => 'puppet:///modules/profile/index.html',
  }
  # Set permissions on the folder so IIS service acccount can read the file
  acl { 'c:\inetpub\bensite':
    permissions => [
      { identity => 'IIS_IUSRS', rights => ['read','execute'] },
    ],
  }
  # Configure IIS site
  iis_site { 'bensite':
    ensure           => 'started',
    physicalpath     => 'c:\inetpub\bensite',
    applicationpool  => 'DefaultAppPool',
    enabledprotocols => 'http',
    bindings         => [
      {
        'bindinginformation' => '*:80:',
        'protocol'           => 'http',
      }
    ],
    #defaultpage      => 'index.html',
    name             => 'bens web site',
  }

  # cat website
  # Create folder
  file {'c:\inetpub\catsite':
    ensure => 'directory',
    owner  => 'system',
  }
  # Install html site
  $extradata = 'This is directly from code'
  file {'c:\inetpub\catsite\cats.html':
    ensure  => 'file',
    content => epp('profile/cats.epp', {'testing' => $testing, 'notencrypted' => $notencrypted, 'encrypted' => $encrypted, 'servertype' => $facts['os']['windows']['product_name']}),
  }
  # Set ACL
  acl { 'c:\inetpub\catsite':
    permissions => [
      { identity => 'IIS_IUSRS', rights => ['read','execute'] },
    ],
  }
  # Configure Cat site
    iis_site { 'cats':
    ensure           => 'started',
    physicalpath     => 'c:\inetpub\catsite',
    applicationpool  => 'DefaultAppPool',
    enabledprotocols => 'http',
    bindings         => [
      {
        'bindinginformation' => '*:80:cats',
        'protocol'           => 'http',
      }
    ],
    defaultpage      => 'cats.html',
    name             => 'cat web site',
  }

  #random file
  file { 'c:\test.txt':
    ensure  => file,
    content => 'Hi!!! from feature_testing  asdfjlasdfj',
  }
}
