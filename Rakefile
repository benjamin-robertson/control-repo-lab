require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet-lint/tasks/puppet-lint'
PuppetLint::RakeTask.new

PuppetSyntax.exclude_paths = ["vendor/**/*"]
PuppetSyntax.hieradata_paths = ["data/**/*.yaml", "data/*.yaml", "hiera.yaml"]
PuppetSyntax.check_hiera_keys = true
PuppetSyntax.manifests_paths = [
    "manifests/*.pp",
    "site-modules/**/*.pp",
]
PuppetSyntax.templates_paths = [
    "site-modules/*/templates/**/*.erb",
    "site-modules/*/templates/**/*.epp",
]