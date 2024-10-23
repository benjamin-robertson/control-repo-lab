forge 'https://forge.puppet.com'

# Hiera data
# mod 'hieradata',
#   git:           'https://github.com/benjamin-robertson/hieradata.git',
#   branch:         :control_branch,
#   default_branch: 'production',
#   install_path:   '.'

mod 'puppetlabs-lvm', '1.4.0'

mod 'dog_site',
  git:          'git@github.com:benjamin-robertson/dog-site.git',
  branch:       :control_branch,
  default_branch:   'main'

mod 'initial_patch',
  git:          'https://github.com/benjamin-robertson/initial_patch.git',
  branch:       :control_branch,
  default_branch:   'main'

# mod 'danieldreier/autosign'
# mod 'ghoneycutt-common', '1.10.0'
# mod 'ghoneycutt-rsyslog', '0.26.0'
# mod 'ghoneycutt-sysklogd', '1.2.0'
mod 'puppet-archive', '7.1.0'
mod 'puppetlabs-acl', '5.0.0'
mod 'puppetlabs-apt', '9.4.0'
mod 'puppetlabs-cd4pe', '3.3.0'
mod 'puppetlabs-cd4pe_jobs', '1.7.0'
mod 'puppetlabs-chocolatey', '8.0.0'
mod 'puppetlabs-concat', '9.0.2'
mod 'puppetlabs-docker', '9.1.0'
mod 'dsc-xpsdesiredstateconfiguration', '9.1.0-0-8'
mod 'puppetlabs-hocon', '2.0.0'
mod 'puppetlabs-iis', '10.0.0'
mod 'puppetlabs-inifile', '6.1.1'

mod 'puppetlabs-powershell', '6.0.0'
mod 'puppetlabs-puppet_agent', '4.19.0'
mod 'puppetlabs-puppet_authorization', '1.0.0'
mod 'puppetlabs-pwshlib', '1.1.1'
mod 'puppetlabs-reboot', '5.0.0'
mod 'puppetlabs-registry', '5.0.1'
mod 'puppetlabs-sshkeys_core', '2.5.0'
mod 'puppetlabs-stdlib', '9.6.0'
#mod 'WhatsARanjit-node_manager', '0.7.4'
mod 'WhatsARanjit-node_manager',
  git:      'git@github.com:benjamin-robertson/puppet-node_manager.git',
  branch:   'master'
#  commit:   '66989b6da249910a194780d77787ef7fd2087d56'
mod 'puppet-windows_firewall', '5.0.0'
mod 'puppetlabs-sqlserver', '5.0.1'
mod 'puppetlabs-wsus_client', '6.1.0'
mod 'geoffwilliams-safe_roles', '1.3.1'

mod 'simp-crypto_policy', '0.6.0'
# mod 'simp-simplib', '4.12.1'
mod 'simp-simplib',
  git:     'git@github.com:benjamin-robertson/pupmod-simp-simplib.git',
  branch:  'SIMP-10745'

# Modules from Git
# Examples: https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd#examples
#mod 'apache',
#  git:    'https://github.com/puppetlabs/puppetlabs-apache',
#  commit: '1b6f89afdde0df7f9433a163d5c4b5328eac5779'

#mod 'apache',
#  git:    'https://github.com/puppetlabs/puppetlabs-apache',
#  branch: 'docs_experiment'

# module puppetlab-motd direct from git.
mod 'puppetlabs-motd', '7.1.0'

mod 'mco_plugin',
  git:              'https://github.com/benjamin-robertson/mco_plugin.git',
  branch:           :control_branch,
  default_branch:   'main'

mod 'benjaminrobertson-observium', '3.0.0'
# mod 'benjaminrobertson-observium',
#   git:              'https://github.com/benjamin-robertson/observium.git',
#   branch:           :control_branch,
#   default_branch:   'devmain'
# deps for observium
mod 'puppetlabs-yumrepo_core', '2.1.0'
mod 'puppetlabs-mysql', '15.0.0'
mod 'puppetlabs-cron_core', '1.3.0'
mod 'puppet-selinux', '4.1.0'
mod 'puppetlabs-apache', '12.1.0'
mod 'puppet-php', '10.1.0'
mod 'puppet-snmp', '7.1.0'
mod 'puppet-firewalld', '5.0.0' # up to here checking
# For Debain only
mod 'domkrm-ufw', '1.1.4'
mod 'puppetlabs-bolt_shim', '0.3.2'
mod 'puppetlabs-augeas_core', '1.5.0'
mod 'puppetlabs-vcsrepo', '5.0.0'
mod 'puppet-gitlab', '8.0.0'

# Comply module and dependcies
mod 'puppetlabs-comply', '3.2.0'
mod 'puppetlabs-java', '9.0.1'
mod 'puppetlabs-ruby_task_helper', '0.6.1'

# Abide and not already included dependices.
#mod 'cem_linux',
#  git:      'git@github.com:benjamin-robertson/puppetlabs-cem_linux.git',
#  branch:   'main'
# mod 'cem_linux',
#   git:       'git@github.com:puppetlabs/puppetlabs-cem_linux.git',
#   tag:       'v1.1.1'
mod 'puppet-systemd', '7.0.0'
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
# mod 'cem_windows',
#   git:      'git@github.com:puppetlabs/puppetlabs-cem_windows.git',
#   tag:      'v1.0.3'
#extra for windows abide
mod 'dsc-computermanagementdsc', '8.5.0-0-0'
mod 'dsc-networkingdsc', '8.2.0-0-3'
mod 'dsc-auditpolicydsc', '1.4.0-0-4'
mod 'dsc-securitypolicydsc', '2.10.0-0-3'
mod 'dsc-storagedsc', '5.0.1-0-2'
mod 'dsc-certificatedsc', '5.1.0-0-0'

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
mod 'puppet-postfix', '4.4.0'
mod 'puppet-alternatives', '5.1.0'
mod 'puppet-cron', '2.0.0'
mod 'puppetlabs-mailalias_core', '1.1.0'
mod 'puppetlabs-mount_core', '1.0.4'
mod 'puppet-nftables', '2.0.0'
mod 'puppetlabs-ntp', '9.0.1'

# Applocker work
# mod 'acsc_e8_application_control',
#  git:             'git@github.com:benjamin-robertson/acsc_e8_application_control.git',
#  branch:          :control_branch,
#  default_branch:  'main'
mod 'benjaminrobertson-acsc_e8_application_control', '1.1.0'

# mod 'applocker',
#   git:            'git@github.com:benjamin-robertson/applocker.git',
#   branch:         :control_branch,
#   default_branch:  'main'

mod 'benjaminrobertson-applocker', '1.0.0'


# Office work
# mod 'acsc_e8_office_hardening',
#  git:              'https://github.com/benjamin-robertson/acsc_e8_office_hardening.git',
#  branch:           :control_branch,
#  default_branch:   'main'
mod 'benjaminrobertson-acsc_e8_office_hardening', '1.0.0'


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

mod 'puppetlabs-ca_extend', '3.2.0'

mod 'soe_linux',
  git:            'git@github.com:benjamin-robertson/soe_linux.git',
  branch:         :control_branch,
  default_branch: 'main'

  # mod 'soe_linux',
  # git:            'git@github.com:benjamin-robertson/soe_linux.git',
  # branch:         'development.',
  # default_branch: 'm1ain'

mod 'platform_module',
  git:            'git@github.com:benjamin-robertson/platform_module.git',
  branch:         :control_branch,
  default_branch: 'main'

# mod 'update_trusted_facts',
#   git:            'git@github.com:benjamin-robertson/update_trusted_facts.git',
#   branch:         :control_branch,
#   default_branch: 'main'
mod 'benjaminrobertson-update_trusted_facts', '2.0.0'

mod 'trlinkin-noop', '1.1.1'

mod 'bootstrap',
  git:            'https://github.com/puppetlabs/puppetlabs-bootstrap.git',
  branch:         'main'

mod 'pe_patch_data',
  git:            'git@github.com:benjamin-robertson/pe_patch_data.git',
  branch:         :control_branch,
  default_branch: 'main',
  install_path:   '.'

mod 'shared_module',
  git:            'git@github.com:benjamin-robertson/shared_module.git',
  branch:         :control_branch,
  default_branch: 'main'

mod 'simp-auditd',
  git:            'git@github.com:benjamin-robertson/pupmod-simp-auditd.git',
  branch:         'SIMP_10744'


mod 'migrate_nodes',
  git:            'git@github.com:benjamin-robertson/migrate_nodes.git',
  branch:         :control_branch,
  default_branch: 'main'

# mod 'enterprise_toolbox',
#   git:            'git@github.com:benjamin-robertson/enterprise_toolbox.git',
#   branch:         :control_branch,
#   default_branch: 'main'

# mod 'find_legacy_facts',
#   git:              'git@github.com:benjamin-robertson/find_legacy_facts.git',
#   branch:         :control_branch,
#   default_branch: 'main'

mod 'benjaminrobertson-find_legacy_facts', '0.2.0'

mod 'benjaminrobertson-enterprise_toolbox', '0.3.0'

# mod 'stdlib9_readiness_checker',
#   git:            'git@github.com:benjamin-robertson/stdlib9_readiness_checker.git',
#   branch:         :control_branch,
#   default_branch: 'main'

mod 'benjaminrobertson-stdlib9_readiness_checker', '0.2.0'