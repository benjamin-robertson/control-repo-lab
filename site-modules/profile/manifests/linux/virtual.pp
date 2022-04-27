# Class: profile::linux::virtual
#
#
class profile::linux::virtual {
  @user { 'ben':
    uid => 2004,
    tag => ['ben'],
  }
}
