# Class: profile::ssh_keys
#
class profile::ssh_keys {
  ssh_authorized_key { 'ben@louie.com':
    ensure => present,
    user   => 'louie',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQC8eiquDgTodyghemx5Pq1KUPqR+GP/KQEDezz8XHQ07nKldh43cvLatS+0TRH3ZvIiYmHMpQzPK12KgzxvdEzHFTICrHQyNmOg3B7LzNDn45siyEf5M/3xG7Re9hc04lUUA/LAVKVjPO/ZhLDMsWecUYA2pi0k7MltNfC2PJ5geJsHKohDnbpVy1TFSUvcJzMYhtrWM3E8A/47C7lzLmGnCI50BGo+NLajbJLCfyBCxCzp/bmKGWkH56VMtScKi/et1F/qA0P9QHJepx2Bl/KufyA6CLsc+3+7JKsN5zGIkT8bQs75Z34aRz5kK0qpbd0cd10A9LEmE9Ina8jLjFP8+DRi6ajOMsugxUP36do83shZebxuZfE/WkS6aY0hOwq25reFIWP35eFh1j/eTy9vkaYoTk66V+nb7MHDEl/RivCwhCTuVUoAz8Es1SgMwK+4gTXpVJqIcYW8OLV5Z2nZEPqCMBXXSSm0z3HggdrgDaZ9B03i9aHmpSW/6PNwfqc=',
  }
}
