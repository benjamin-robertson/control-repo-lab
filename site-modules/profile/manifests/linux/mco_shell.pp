# Class: mco_shell
#
#
class profile::linux::mco_shell (
  String $mco_location = "/opt/puppetlabs/mcollective/plugins/mcollective/agent/",
  Variant[Array, Pattern[/^\w*\.\w*$/, /^\w*\/\w*\.\w*$/]] $mco_files = ['shell.rb','shell.ddl','shell/job.rb'],
) {
  # check to see if direcotry need to be created.
  $mco_files.each | String $files| {
    if $files =~ /^\w*\/\w*\.\w*$/ {
      $folder_to_create = split($files, '/')
      notify{"Creating directory for ${folder_to_create}":}
      file {"${mco_location}${folder_to_create}":
        ensure => direcotry,
      }
    }
  }

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
