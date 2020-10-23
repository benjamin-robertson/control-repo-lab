class profile::windows::scope_test {
  notify{"Varible Ben = ${ben}":}
  File {
    content => 'From resource default in this class',
  }
  file { 'text.txt':
    path   => 'c:\temp\test.txt',
    ensure => 'present',
  }
}
