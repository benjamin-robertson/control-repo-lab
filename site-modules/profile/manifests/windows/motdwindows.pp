class profile::windows::motdwindows {
  class { 'motd':
    content => 'Welcome to windows resource like class defintion',
  }
}
