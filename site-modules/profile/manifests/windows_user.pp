# Class: profile::windows_user
#
class profile::windows_user {
  $password = Sensitive(lookup('tempadmin::password'))

  user { 'tempadmin':
    ensure   => present,
    groups   => 'Administrators',
    password => $password.unwrap,
  }
}
