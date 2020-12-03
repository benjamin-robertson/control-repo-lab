# Classs profile::job_hardware::motd
#
#
class profile::job_hardware::motd {
  class { 'motd':
    content => 'Welcome to the job hardware',
  }
}
