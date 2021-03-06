class profile::pe_master::node_classify {
  node_group { 'Windows Hosts - auto':
    ensure      => 'present',
    environment => 'production',
    rule        => ['and', ['=', ['fact', 'osfamily'], 'windows'],['not',['~', 'name', 'dev']]],
    parent      => 'All Nodes',
    classes     => {'role::windows_server' => { }},
  }
  node_group { 'Linux host - auto':
    ensure      => 'present',
    environment => 'production',
    rule        => ['and', ['=', ['fact', 'osfamily'], 'RedHat'],['not',['~', ['fact', 'pe_major_version'], '']]],
    parent      => 'All Nodes',
    #classes     => {'role::windows_server' => {}},
  }
  node_group { 'Windows Hosts - dev':
    ensure               => 'present',
    environment          => 'development',
    rule                 => ['and', ['~', 'name', 'dev']],
    parent               => 'All Nodes',
    #override_environment => 'true',
    classes              => {'role::windows_server' => { }},
  }
}
