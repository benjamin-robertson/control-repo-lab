class profile::windows::logon_as_service
( Array $logon_as_service_accounts = ['ben','NT SERVICE\ALL SERVICES'] )
{
  # TODO: What if you wanted to extend this profile to allow certain nodes to have
  #  different lists of users log on as a service. A good example could be that a
  # certain application requires that "appuer" can log on as a service, but not all
  # servers have this application. How could you handle that?
  #
  # Still neeed this ^^
  # 
  # Ben: Are you after something like this? using a paramater which can be changed when the class is called?

  dsc_userrightsassignment { 'Log on as a service':
    dsc_ensure   => 'Present',
    dsc_identity => ["${facts['hostname']}\\ben","NT SERVICE\\ALL SERVICES"],
    dsc_policy   => 'Log_on_as_a_service',
  }

}
