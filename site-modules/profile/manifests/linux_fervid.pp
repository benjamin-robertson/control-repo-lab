# Class: profile::linux_fervid
#
#
class profile::linux_fervid {
  class {'::secure_linux_cis':
    time_servers => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
    profile_type => 'server',
    allow_users  => ['trusteduser', 'root'],
}
}
