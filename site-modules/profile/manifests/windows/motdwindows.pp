class profile::windows::motdwindows (
  String $content = undef,
) {
  class { 'motd':
    content => $content,
  }
}
