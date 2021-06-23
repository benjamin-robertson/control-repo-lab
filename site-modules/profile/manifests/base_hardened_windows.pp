# Class: profile::base_hardened_windows
#
#
class profile::base_hardened_windows {
  include abide_windows

  # launch to pc not quick access
  registry::value {'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\LaunchTo':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
    value => 'LaunchTo',
    type  => 'dword',
    data  => 1,
  }

  # show file extension
  registry::value {'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
    value => 'HideFileExt',
    type  => 'dword',
    data  => 0,
  }

  #registry::value {'HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\LaunchTo':
  #  key   => 'HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
  #  value => 'LaunchTo',
  #  type  => 'dword',
  #  data  => 1,
  #}
}
