class profile::login_as_service {

  local_security_policy { 'Log on as a service':
    ensure => 'present',
    policy_value => ['ben','cloudbase-init','NT SERVICE\ALL SERVICES']
  }

}
