# Class: mco_shell
#
#
class profile::linux::mco_shell (
  String $mco_location = "/opt/puppetlabs/mcollective/plugins/mcollective/agent/",
  Array $mco_files = ['shell.rb','shell.ddl','/shell/job.rb'],
) {
  # iterate over the array of files to manage
  $mco_files.each | String $files| {
    file {"${mco_location}${files}":
      ensure => present,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => "puppet:///modules/profile/${files}",
    }
  }
}
