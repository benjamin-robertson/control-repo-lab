class profile::windows::scope_test {
  notify{"Varible Ben = ${ben}":}
  file { 'text.txt':
    path   => 'c:\temp\test.txt',
    ensure => 'present',
  }
}
