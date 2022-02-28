# Class: profile::lab::delay
#
# Delay script
#
class profile::lab::delay {
  if puppet_run_offset::run_offset(1800, 2, $facts['uptime_seconds'], $facts['uptime_hours']) {
    notify {'I am running because we just started':}
  }
}
