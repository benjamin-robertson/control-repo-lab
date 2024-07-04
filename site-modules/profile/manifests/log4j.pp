# Class: profile::log4j
#
#
class profile::log4j {
  # resources
  notify { "${profile::ip_even($facts['networking']['ip'])}":
  }
}
