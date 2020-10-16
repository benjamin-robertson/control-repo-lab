class profile::base {
  #the base profile should include component modules that will be on all nodes
  include profile::users
  include profile::groups
  include profile::logon_as_service
  include profile::create_file
  include profile::registry
}
