# Class: profile::linux::fervid_cis
#
# fervid on ubunut 20.04
#
class profile::linux::fervid_cis {

  class {'::secure_linux_cis':
    time_servers => ['169.254.169.123', 'ntp.ubuntu.com'],
    profile_type => 'server',
    allow_users  => ['ubuntu'],
  }
}
