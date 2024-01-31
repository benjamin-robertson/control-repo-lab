# Class: profile::linux::m
#
# @param motdcontent motd stuff goes here
class profile::linux::motd_linux (
  String $motdcontent,
) {
  #$motdcontent = lookup(motd_linux)
  Class { 'motd':
    content => $motdcontent,
  }

  postfix::hash { '/etc/postfix/.sasl_passwd':
    ensure => present,
    source => 'puppet:///modules/profile/sasl_passwd',
  }
}
