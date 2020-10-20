class profile::choco {
  include chocolatey
  package { '7zip.install':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
  package { 'vlc':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
  #Reboot after installation of 7zip
  reboot { 'afterInstall':
    subscribe  => package['7zip.install'],
  }
}
