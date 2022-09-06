class profile::windows::scope_test {
  #notify{"Varible Ben = ${ben}":}
  File {
    content => 'Set in scope test class',
  }
  file { 'text.txt':
    path   => 'c:\temp\test.txt',
    ensure => 'present',
  }
}
