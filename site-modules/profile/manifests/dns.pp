# Class: profile::dns
# @summary Set dns resolvers on nodes
#
# @param resolvers Array of DNS resovlers to set.
#
class profile::dns (
  Array $resolvers = ['1.1.1.1', '8.8.8.8'],
) {
  file { '/etc/resolv.conf':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    content => epp('profile/resolv.conf.epp', { resolvers => $resolvers }),
  }
}
