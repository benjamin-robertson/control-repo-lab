# Class: profile::linux::tmp_file
#
# @param louis 
#
class profile::linux::tmp_file (
  String $louis
) {
  $string_val = @("louis")
    jquans files
    is good
    | - louis

  file { '/tmp/louis.txt':
    ensure  => file,
    content => $louis,
  }

  file { '/tmp/ben.txt':
    ensure  => file,
    content => $string_val,
  }
}
