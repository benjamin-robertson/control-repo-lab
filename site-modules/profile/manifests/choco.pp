class profile::choco {
  include chocolatey
  package { '7zip.install':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
}
