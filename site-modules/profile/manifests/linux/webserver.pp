# Class: profile::linux::webserver
#
#
class profile::linux::webserver {
  include apache
  class { 'php':
    extensions => {
      'mysql' => {
        ensure   => installed,
        provider => apt,
      },
    }
  }
}
