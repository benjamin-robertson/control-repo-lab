# Class: profile::linux::webserver
#
#
class profile::linux::webserver {
  include apache
  class { 'php':
    extensions => {
      'mysqli' => {
        ensure   => installed,
        provider => apt,
      },
    }
  }
}
