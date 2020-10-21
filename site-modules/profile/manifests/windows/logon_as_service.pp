class profile::windows::logon_as_service
( String $logon_as_service_accounts = 'ben,cloudbase-init,NT SERVICE\ALL SERVICES,test' )
{

  # TODO: What if you wanted to extend this profile to allow certain nodes to have
  #  different lists of users log on as a service. A good example could be that a
  # certain application requires that "appuer" can log on as a service, but not all
  # servers have this application. How could you handle that?
  #
  # Still neeed this ^^

  local_security_policy { 'Log on as a service':
    ensure       => 'present',
    policy_value => $logon_as_service_accounts,
  }

}
