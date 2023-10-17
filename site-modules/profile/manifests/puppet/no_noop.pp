# Class: profile::puppet::no_noop
# 
# @summary Class which sets noop = false for the puppet_enterprise::profile::agent class
#
class profile::puppet::no_noop {
  noop(false)
  include puppet_enterprise::profile::agent
}
