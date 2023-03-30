# Class: profile::linux::files
#
# make some random files
#
class profile::linux::files {
  noop(false)
  file { '/tmp/testfile.txt':
    content => 'This wont get made',
  }
}
