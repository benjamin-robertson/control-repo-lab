# Classs profile::base_job_hardware
#
#
class profile::base_job_hardware {
  include profile::job_hardware::docker
  include profile::job_hardware::motd
}
