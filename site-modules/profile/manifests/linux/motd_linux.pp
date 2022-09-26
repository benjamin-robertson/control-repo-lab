# Class: profile::linux::m
#
class profile::linux::motd_linux (
  String $motdcontent,
) {
  #$motdcontent = lookup(motd_linux)
  Class { 'motd':
    content => $motdcontent,
  }
}
