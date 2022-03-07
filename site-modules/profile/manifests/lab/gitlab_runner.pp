# Class: profile::lab::gitlab_runner
#
# Install gitlab runner
#
class profile::lab::gitlab_runner (
  String $ca_content,
) {
  include gitlab_ci_runner

  file {'/etc/ssl/certs/mycoolca.pem':
    content => $ca_content,
  }
}
