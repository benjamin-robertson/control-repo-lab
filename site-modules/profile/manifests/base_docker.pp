# Class: profile::base_docker
#
# Installs docker
#
class profile::base_docker {
  Class docker {
    proxy => '172.31.11.63:3128',
  }
}
