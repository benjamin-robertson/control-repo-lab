# Class: profile::windows_chrome
#
#
class profile::windows_chrome {
  include chocolatey

  package { 'googlechrome':
    ensure   => latest,
    provider => 'chocolatey',
    requrie  => Class['chocolatey'],
  }

}
