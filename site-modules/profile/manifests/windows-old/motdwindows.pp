class profile::windows::motdwindows (
  String $content = undef,
) {
  include motd
  #class { 'motd':
  #  content => $content,
  #}
}
