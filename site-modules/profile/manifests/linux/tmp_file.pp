# Class: profile::linux::tmp_file
#
# @param louis 
#
class profile::linux::tmp_file (
  String $louis
) {
  file { '/tmp/louis.txt':
    ensure  => file,
    content => $louis,
  }
}
