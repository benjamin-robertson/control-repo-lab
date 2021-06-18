# Class: profile::windows_disk
#
#
class profile::windows_disk {

  # Make the d drive
  dsc_disk { 'ddrive':
    dsc_diskid         => '1',
    dsc_driveletter    => 'D',
    dsc_partitionstyle => 'GPT',
    dsc_fslabel        => 'ddrive',
    dsc_fsformat       => 'NTFS',
  }

}
