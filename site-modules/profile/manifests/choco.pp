class profile::choco {
  include chocolatey
  package { '7zip.install':
    ensure   => 'absent',
    provider => 'chocolatey',
  }
  package { 'vlc':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
}
