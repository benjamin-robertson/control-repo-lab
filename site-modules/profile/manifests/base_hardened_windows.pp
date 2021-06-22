# Class: profile::base_hardened_windows
#
#
class profile::base_hardened_windows {
  include abide_windows

  registry::value {'HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\LaunchTo':
    key   => 'HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
    value => 'LaunchTo',
    type  => 'dword',
    data  => 1,
  }
}
