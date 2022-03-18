# Class: profile::lab::mysql
#
#
class profile::lab::mysql {
  include mysql::server

  mysql::db { 'bensdb':
    user     => ben,
    password => lookup('mysql::server::root_password'),
    host     => 'localhost',
    grant    => 'ALL',
    charset  => 'latin1',
  }
}
