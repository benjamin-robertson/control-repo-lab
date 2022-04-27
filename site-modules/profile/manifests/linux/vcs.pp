# Class: profile::linux::vcs
#
#
class profile::linux::vcs {
  vcsrepo { '/tmp/dogsite':
    ensure   => mirror,
    provider => git,
    source   => 'https://github.com/benjamin-robertson/dog-site.git',
    branch   => 'main',
  }
}
