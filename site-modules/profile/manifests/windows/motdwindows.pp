class profile::windows::motdwindows {
  #include motd
  #class { 'motd':
  #  content => 'Welcome to windows resource like class defintion',
  #}
}
