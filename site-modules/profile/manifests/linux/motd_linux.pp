# Class: profile::linux::m
#
class profile::linux::motd_linux {
  Class { 'motd':
    content => 'Welcome to the linux system motd message, enjoy!!!',
  }
}
