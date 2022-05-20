forge 'https://forge.puppet.com'

# Hiera data
#mod 'hieradata',
#  git:           'https://github.com/benjamin-robertson/hieradata.git',
#  branch:        'main',
#  branch:       :control_branch,
#  default_branch:   'main',
#  install_path:  '.'

mod 'dog_site',
  git:          'git@github.com:benjamin-robertson/dog-site.git',
#  branch:       'main'
  branch:       :control_branch,
  default_branch:   'main'

mod 'initial_patch',
  git:          'https://github.com/benjamin-robertson/initial_patch.git',
  branch:       :control_branch,
  default_branch:   'main'

mod 'danieldreier/autosign'
mod 'ghoneycutt-common', '1.10.0'
mod 'ghoneycutt-rsyslog', '0.26.0'
mod 'ghoneycutt-sysklogd', '1.2.0'
mod 'puppet-archive', '6.0.2'
mod 'puppetlabs-acl', '3.2.0'
mod 'puppetlabs-apt', '7.6.0'
mod 'puppetlabs-cd4pe', '3.2.2'
mod 'puppetlabs-cd4pe_jobs', '1.6.0'
mod 'puppetlabs-chocolatey', '6.0.1'
mod 'puppetlabs-concat', '7.0.2'
mod 'puppetlabs-docker', '4.1.2'
mod 'dsc-xpsdesiredstateconfiguration', '9.1.0-0-2'
mod 'puppetlabs-hocon', '1.1.0'
mod 'puppetlabs-iis', '8.0.2'
mod 'puppetlabs-inifile', '5.2.0'
mod 'puppetlabs-pipelines', '1.0.1'
mod 'puppetlabs-powershell', '5.0.0'
mod 'puppetlabs-puppet_agent', '4.8.0'
mod 'puppetlabs-puppet_authorization', '0.5.1'
mod 'puppetlabs-pwshlib', '0.10.0'
mod 'puppetlabs-reboot', '3.1.0'
mod 'puppetlabs-registry', '3.2.0'
mod 'puppetlabs-sshkeys_core', '2.2.0'
mod 'puppetlabs-stdlib', '7.1.0'
mod 'WhatsARanjit-node_manager', '0.7.5'
#mod 'webalex-windows_firewall', '0.2.0'
mod 'puppet-windows_firewall', '4.0.0'
mod 'puppetlabs-sqlserver', '3.0.0'
mod 'puppetlabs-wsus_client', '4.0.0'


# Modules from Git
# Examples: https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd#examples
#mod 'apache',
#  git:    'https://github.com/puppetlabs/puppetlabs-apache',
#  commit: '1b6f89afdde0df7f9433a163d5c4b5328eac5779'

#mod 'apache',
#  git:    'https://github.com/puppetlabs/puppetlabs-apache',
#  branch: 'docs_experiment'

# module puppetlab-motd direct from git. 
mod 'puppetlabs-motd', '6.1.0'

mod 'mco_plugin',
  git:              'https://github.com/benjamin-robertson/mco_plugin.git',
  branch:           :control_branch,
  default_branch:   'main'

mod 'benjaminrobertson-observium', '1.0.0'
# deps for observium
mod 'puppetlabs-yumrepo_core', '1.0.7'
mod 'puppetlabs-mysql', '12.0.1'
mod 'puppetlabs-cron_core', '1.0.5'
mod 'puppet-selinux', '3.4.0'
mod 'puppetlabs-apache', '6.2.0'
mod 'puppet-php', '8.0.3'
mod 'puppet-snmp', '6.0.0'
mod 'puppet-firewalld', '4.4.0'
# For Debain only
mod 'domkrm-ufw', '1.1.4'
mod 'puppetlabs-bolt_shim', '0.3.2'
mod 'puppetlabs-augeas_core', '1.1.2'
mod 'puppetlabs-vcsrepo', '5.0.0'
mod 'puppet-gitlab', '8.0.0'

# Comply module and dependcies
mod 'puppetlabs-comply', '2.4.0'
mod 'puppetlabs-java', '7.3.0'
mod 'puppetlabs-ruby_task_helper', '0.6.0'

# Abide and not already included dependices.
#mod 'cem_linux',
#  git:      'git@github.com:benjamin-robertson/puppetlabs-cem_linux.git',
#  branch:   'main'
mod 'cem_linux',
  git:       'git@github.com:puppetlabs/puppetlabs-cem_linux.git',
  tag:       'v1.1.1'
mod 'camptocamp-systemd', '3.0.0'
mod 'puppetlabs-firewall', '3.1.0'
mod 'puppetlabs-mount_providers', '2.0.1'
mod 'herculesteam-augeasproviders_core', '3.0.0'
mod 'herculesteam-augeasproviders_sysctl', '2.6.0'
mod 'herculesteam-augeasproviders_grub', '3.2.0'
mod 'herculesteam-augeasproviders_mounttab', '2.1.1'
mod 'herculesteam-augeasproviders_pam', '2.2.1'
mod 'herculesteam-augeasproviders_shellvar', '4.0.0'
mod 'herculesteam-augeasproviders_ssh', '4.0.0'
mod 'puppet-logrotate', '5.0.0'
# Windows abide
#mod 'cem_windows',
#  git:      'git@github.com:benjamin-robertson/puppetlabs-cem_windows.git',
#  branch:   'cis_level_2'
mod 'cem_windows',
  git:      'git@github.com:puppetlabs/puppetlabs-cem_windows.git',
  tag:      'v1.0.3'
#extra for windows abide
mod 'dsc-computermanagementdsc', '8.5.0-0-0'
mod 'dsc-networkingdsc', '8.2.0-0-3'
mod 'dsc-auditpolicydsc', '1.4.0-0-2'
mod 'dsc-securitypolicydsc', '2.10.0-0-3'
mod 'dsc-storagedsc', '5.0.1-0-2'

mod 'beergeek-disable_noop', '0.1.1'

# report module
mod 'syslog_reports',
  git:              'git@github.com:benjamin-robertson/syslog_reports.git',
  branch:           :control_branch,
  default_branch:   'main'
#mod 'beersy-hiera_eyaml_setup', '0.1.2'
mod 'hiera_eyaml_setup',
  git:              'https://github.com/benjamin-robertson/eyamlamadingdong.git',
  branch:           'master'

# Add fervid and dependendies
mod 'fervid-secure_linux_cis', '2.1.18'
#mod 'fervid-secure_linux_cis',
#  git:              'https://github.com/benjamin-robertson/secure_linux_cis.git',
#  branch:           'main'
mod 'puppet-chrony', '2.0.0'
mod 'camptocamp-augeas', '1.9.0'
mod 'puppet-kmod', '3.0.0'
mod 'camptocamp-postfix', '1.12.0'
mod 'kemra102-auditd', '2.2.0'
mod 'puppet-alternatives', '3.0.0'
mod 'puppet-cron', '2.0.0'
mod 'puppetlabs-mailalias_core', '1.0.6'
mod 'puppetlabs-mount_core', '1.0.4'
mod 'puppet-nftables', '2.0.0'
mod 'puppetlabs-ntp', '9.0.1'

# Applockler work
#mod 'acsc_e8_application_control',
#  git:             'git@github.com:benjamin-robertson/acsc_e8_application_control.git',
#  branch:          :control_branch,
#  default_branch:  'main'
#mod 'benjaminrobertson-acsc_e8_application_control', '0.1.0'
mod 'benjaminrobertson-acsc_e8_application_control',
  git:           'git@github.com:benjamin-robertson/acsc_e8_application_control.git',
  branch:        :control_branch,
  default_branch: 'main'
mod 'fervid-applocker', '1.0.0'
#mod 'fervid-applocker',
#  git:           'git@github.com:benjamin-robertson/applocker.git',
#  branch:        'master'

# Office work
#mod 'acsc_e8_office_hardening',
#  git:              'https://github.com/benjamin-robertson/acsc_e8_office_hardening.git',
#  branch:           :control_branch,
#  default_branch:   'main'
mod 'benjaminrobertson-acsc_e8_office_hardening', '0.1.0'

# Run offset 
mod 'puppet_run_offset',
  git:            'git@github.com:benjamin-robertson/puppet_run_offset.git',
  branch:         :control_branch,
  default_branch: 'main'

mod 'aws_ssm',
  git:            'git@github.com:benjamin-robertson/aws_ssm.git',
  branch:         :control_branch,
  default_branch: 'main'

#mod 'puppet-gitlab_ci_runner', '4.3.0'
mod 'gitlab_ci_runner',
  git:            'git@github.com:benjamin-robertson/puppet-gitlab_ci_runner.git',
  branch:         'issue_144'

