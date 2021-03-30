# Class: profile::base_mssql
#
#
class profile::base_mssql {
  sqlserver_instance{ 'BenSQL':
    features              => ['SQL'],
    source                => 'C:/',
    sql_sysadmin_accounts => ['myuser'],
  }
}
