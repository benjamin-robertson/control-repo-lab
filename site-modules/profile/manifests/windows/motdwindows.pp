class profile::windows::motdwindows (
  String $content = undef,
) {
  include motd
  class { 'motd':
    content => 'Welcome to windows resource like class defintion',
  }
}
