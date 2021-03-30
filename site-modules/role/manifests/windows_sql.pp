# Class: role::windows_sql
#
#
class role::windows_sql {
  #include profile::base_windows
  include profile::base_mssql
}
