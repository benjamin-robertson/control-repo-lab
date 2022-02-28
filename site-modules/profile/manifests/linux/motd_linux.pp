# Class: profile::linux::m
#
class profile::linux::motd_linux (
  String $motdcontent = 'test Paramater'
) {
  #$motdcontent = lookup(motd_linux)
  $uptimeseonds = $facts['uptime_seconds'] / 3600
  notify {"${uptimeseonds}":}
  #if $facts[]
  Class { 'motd':
    content => $motdcontent,
  }
}
