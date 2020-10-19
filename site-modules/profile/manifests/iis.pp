class profile::iis {

# install IIS feature
  dsc_windowsfeature {'IIS':
    ensure => 'present',
    dsc_name => 'Web-Server',
  }
}
