# TODO: I realise that this is just to satisfy the "Create a new directory" requirement,
# but still: Puppet classes hould not have verbs in their names. Since Puppet represents
# a desired states, verbs like "create", "delete" "remove", "install" etc. don't entirely
# make sense since Puppet won't always do the same thing in order to get the nodes into
# its desired state. The first time this runs it might create the tempdir, but after that
# it won't do anything since the directory is already there and the permissions are set.
# A better name would be somwething like "profile::tempdir_permissinos".
class profile::windows_classes::tempdir_permissions {

  if $facts['osfamily'] == 'windows' {
    file { 'c:\temp':
      ensure => 'directory',
      owner  => 'ben',
      group  => 'bensgroup',
    }
    #set the ACL on the file
    acl { 'c:\temp':
      permissions => [
        { identity => 'ben', rights => ['full'] },
        { identity => 'bensgroup', rights => ['read','execute']},
      ],
    }
  }
}
