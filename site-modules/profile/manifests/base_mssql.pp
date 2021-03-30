# Class: profile::base_mssql
#
#
class profile::base_mssql {
  sqlserver_instance{ 'BenSQL':
    features              => ['SQL'],
    source                => 'C:/iso/',
    sql_sysadmin_accounts => ['Administrator'],
  }
}
