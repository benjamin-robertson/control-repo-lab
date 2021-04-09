# Classs profile::base_job_hardware
#
#
class profile::base_job_hardware_windows {
  class { 'docker':
    docker_ee => true
  }
  include profile::job_hardware::motd
}
