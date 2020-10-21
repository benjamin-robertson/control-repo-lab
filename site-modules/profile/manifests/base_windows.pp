class profile::base_windows {
  # TODO: This is a good improvement. We can tell just by glancing that these
  # are only relevant on Windows servrs which is good, though is there anything
  # in the code stopping us from applying it to a non-windows server? Also the
  # word "classes" in the name here is redundant. It's implpied that it's a
  # class by the fact that it's a class. Like how it would be redundant to
  # name a variable $user_variable, we know it's a variable by the syntax and
  # the usage, no need to reiterate it in this instance

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
