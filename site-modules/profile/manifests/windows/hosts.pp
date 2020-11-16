class profile::windows::hosts {
  $hosts = 'C:\Windows\System32\drivers\etc\hosts'

  concat { $hosts:
    ensure  => present,
    replace => true,
    order   => 'numeric',
  }

  concat::fragment { $hosts:
    target => $hosts,
    source => 'puppet:///modules/profile/hosts.txt',
    order  => '01',
  }
}
