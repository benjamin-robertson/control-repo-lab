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
    purge_behavior       => 'none',
    rule                 => ['or',
  ['and',
    ['=',
      ['fact', 'aio_agent_version'],
      'louie']],
  ['=', 'name', 'ip-172-31-28-67.ap-southeast-2.compute.internal']],
  }

  node_group { 'test123':
    ensure               => 'present',
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    provider             => 'https',
    rule                 => [''],
  }

    node_group { 'test1234':
    ensure               => 'present',
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    provider             => 'https',
  }

  node_group { 'test12':
    ensure               => 'present',
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    provider             => 'https',
    purge_behavior       => 'none',
    rule                 => ['or',
  ['=', 'name', 'ip-172-31-4-194.ap-southeast-2.compute.internal']],
  }

    node_group { 'test1':
    ensure               => 'present',
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    provider             => 'https',
    purge_behavior       => 'none',
    rule                 => ['and',
  ['=',
    ['fact', 'apt_dist_updates'],
    'dafsdf']],
  }
}
