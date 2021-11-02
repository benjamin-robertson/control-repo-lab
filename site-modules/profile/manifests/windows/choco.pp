class profile::windows::choco {
  require chocolatey
  package { '7zip':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
  package { 'vlc':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
  package { 'notepadplusplus.install':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
  #Reboot after installation of 7zip
  reboot { 'afterInstall':
    subscribe  => Package['7zip'],
  }
}
