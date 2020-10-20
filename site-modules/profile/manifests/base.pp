class profile::base {
  # TODO: There are already a few profiles in here and we are only covered a very small
  # example of a baseline on one OS. If the intention is that profile::base would be the
  # baseline that would be applied to all systems we will end up with a hell of a lot of
  # profiles in this folder. Is there some method of organising profiles that you could
  # adopt which might work towards the following goals:
  #
  #  * Make the codebase more irganised and easier to navigate
  #  * Allow for more context in the names of the profiles. It would be good to be able
  #    to tell if this profile is like a baseline that is applied to everything? Or just
  #    windows? Or just a specific app?

  #the base profile should include component modules that will be on all nodes
  include profile::users
  include profile::groups
  include profile::logon_as_service
  include profile::create_file
  include profile::registry
  include profile::iis
  #include profile::install_archive
  include profile::choco
}
