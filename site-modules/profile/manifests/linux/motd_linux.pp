# Class: profile::linux::m
#
class profile::linux::motd_linux {
  Class { 'motd':
    content => @(EOT)
    Welcome to the linux system motd message, enjoy!!!
    This is been placed over many lines
    Lines are good
    It's easier to read :)
    Adding extra stuff to test compiler
    Upgraded to 2019.8.4
    | EOT
  }
}
