# Class: profile::base_obInclude observium module class
#
class profile::base_observium_offline {
  # Include observium module class
$my_repo = { 'epel' => {
    'ensure'   => 'present',
    'enabled'  => '1',
    'descr'    => 'Extra packages for enterprise linux',
    'baseurl'  => 'http://myrepo.local/epel7',
    'gpgcheck' => '1',
    'gpgkey'   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
    'target'   => '/etc/yum.repos.d/epel.repo',
    },
}

class { 'observium':
    repos          => $my_repo,
    download_url   => '/tmp/',
    installer_name => 'observium-community-latest.tar.gz',
}
}
