# Class: profile::lab::gitlab_runner
#
# Install gitlab runner
#
class profile::lab::gitlab_runner (
  String $ca_content,
) {
  include gitlab_ci_runner

  file {'/tmp/mycertificate.crt':
    content => $ca_content,
  }
}
