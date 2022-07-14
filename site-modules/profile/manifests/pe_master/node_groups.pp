# Class: profile::pe_master::node_groups
#
#
class profile::pe_master::node_groups {
  node_group { 'test_group':
    ensure               => 'present',
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    provider             => 'https',
    rule                 => ['or',
    ['=', 'name', 'ip-172-31-28-67.ap-southeast-2.compute.internal']],
  }
}
