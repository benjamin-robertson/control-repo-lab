# Class: profile::linux::postfix
#
#
class profile::linux::postfix (
  Hash $options = {}
) {
  # create postfix
  class { 'postfix':
    relayhost => 'test.mail.com',
    # * => $options,
  }
}
