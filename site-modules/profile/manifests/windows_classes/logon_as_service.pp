class profile::windows_classes::logon_as_service {

  # TODO: What if you wanted to extend this profile to allow certain nodes to have
  #  different lists of users log on as a service. A good example could be that a
  # certain application requires that "appuer" can log on as a service, but not all
  # servers have this application. How could you handle that?

  # TODO: Alignment
  local_security_policy { 'Log on as a service':
    ensure       => 'present',
    policy_value => 'ben,cloudbase-init,NT SERVICE\ALL SERVICES'
  }

}
