class profile::iis {

# install IIS feature
  dsc_windowsfeature {'IIS':
    ensure => 'present',
    dsc_name => 'Web-Server',
  }
# remove default website
/*  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }*/

}
