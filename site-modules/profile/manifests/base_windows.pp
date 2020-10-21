class profile::base_windows {
  # TODO: There are already a few profiles in here and we are only covered a very small
  # example of a baseline on one OS. If the intention is that profile::base would be the
  # baseline that would be applied to all systems we will end up with a hell of a lot of
  # profiles in this folder. Is there some method of organising profiles that you could
  # adopt which might work towards the following goals:
  #
  #  * Make the codebase more organised and easier to navigate
  #  * Allow for more context in the names of the profiles. It would be good to be able
  #    to tell if this profile is like a baseline that is applied to everything? Or just
  #    windows? Or just a specific app?

  #the base profile should include component modules that will be on all nodes
  include profile::windows_classes::users
  include profile::windows_classes::groups
  include profile::windows_classes::logon_as_service
  include profile::windows_classes::tempdir_permissions
  include profile::windows_classes::registry
  include profile::windows_classes::iis
  #include profile::windows_classes::maintain_7zip
  include profile::windows_classes::choco
}
