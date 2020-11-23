class profile::windows::motdwindows (
  String $content = undef,
) {
  class { 'motd':
    content => 'Welcome to windows resource like class defintion',
  }
}
