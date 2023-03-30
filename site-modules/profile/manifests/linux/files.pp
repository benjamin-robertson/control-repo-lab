# Class: profile::linux::files
#
# make some random files
#
class profile::linux::files {
  file { '/tmp/testfile.txt':
    content => 'This wont get made',
  }
}
