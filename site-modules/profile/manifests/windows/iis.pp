class profile::windows::iis {

  #$website = "<HTML><HEAD><TITLE>Ben's super really cool website</TITLE></HEAD><BODY><h1>Welcome to ben's pretty cool website</h1><br/><p>This website is hosted on IIS, pretty basic, however its been configured and all setup via Puppet. No manual intervention required, repeatable and automated :) </p></BODY></HTML>"

  # install IIS feature
  dsc_windowsfeature {'IIS':
    ensure   => 'present',
    dsc_name => 'Web-Server',
  }
  dsc_windowsfeature {'IIS-tools':
    ensure   => 'present',
    dsc_name => 'Web-Mgmt-Tools',
  }
    dsc_windowsfeature {'IIS-tools-scripts':
    ensure   => 'present',
    dsc_name => 'Web-Scripting-Tools',
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
    source => 'puppet:///modules/iis/files/index.html',
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
    defaultpage      => 'index.html',
    name             => 'bens web site',
  }
}
