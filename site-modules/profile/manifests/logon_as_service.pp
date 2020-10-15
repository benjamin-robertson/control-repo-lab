class profile::logon_as_service {

  local_security_policy { 'Log on as a service':
    ensure => 'present',
    #policy_value => ['cloudbase-init','ben','NT SERVICE\ALL SERVICES']
    policy_value => 'ben'
  }

}
