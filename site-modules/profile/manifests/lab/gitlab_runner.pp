# Class: profile::lab::gitlab_runner
#
# Install gitlab runner
#
class profile::lab::gitlab_runner {
  include gitlab_ci_runner
}
