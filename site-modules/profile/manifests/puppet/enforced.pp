# Class: profile::puppet::enforced
# 
# @summary Class which sets noop = false for the puppet_enterprise::profile::agent class
#
class profile::puppet::enforced {
  # if $facts['is_pe'] == false {
  noop(false)
  include puppet_enterprise::profile::agent
  # }
}
