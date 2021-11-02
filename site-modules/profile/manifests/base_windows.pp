class profile::base_windows {
  # TODO: This is a good improvement. We can tell just by glancing that these
  # are only relevant on Windows servrs which is good, though is there anything
  # in the code stopping us from applying it to a non-windows server? Also the
  # word "classes" in the name here is redundant. It's implpied that it's a
  # class by the fact that it's a class. Like how it would be redundant to
  # name a variable $user_variable, we know it's a variable by the syntax and
  # the usage, no need to reiterate it in this instance

  # Ben: yes, most of these forge modules are windows only, IE, chocotaley, IIS, GPO, registry, 7zip installer would only work on Windows. 
  # However the users\groups would work on Linux, however in my example I've added the user to the "Administrators" group. Which would
  # not exist on Linux, (unless created of course).

  #the base profile should include component modules that will be on all nodes
  include profile::windows::users
  include profile::windows::groups
  include profile::windows::logon_as_service
  include profile::windows::tempdir_permissions
  include profile::windows::registry
  include profile::windows::iis
  include profile::windows::choco
  include profile::windows::scope_test
  include profile::windows::hosts
  include profile::windows::vscode
  include profile::windows::motdwindows
  include profile::windows::installstuff
  include dog_site
}
