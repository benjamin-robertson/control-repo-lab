# Class: profile::lab::archive_test
#
# testing the archive module
# 
class profile::lab::archive_test {
  archive { 'test file':
    path          => '/tmp/myfile.txt',
    source        => 'http://ip-172-31-11-63.ap-southeast-2.compute.internal/myfile.txt',
    checksum_url  => 'http://ip-172-31-11-63.ap-southeast-2.compute.internal/myfile.txt',
    checksum_type => 'sha1',
  }
}
