class profile::pe_master::node_classify {
  node_group { 'Windows Hosts - auto':
    ensure      => 'present',
    environment => 'production',
    rule        => ['and', ['=', ['fact', 'osfamily'], 'windows']],
    parent      => 'All Nodes',
    classes     => {'role::windows_server' => {}},
  }
  node_group { 'Linux host - auto':
    ensure      => 'present',
    environment => 'production',
    #rule        => ['and', ['=', ['fact', 'osfamily'], 'RedHat']],
    #rule        => ['and', ['=', ['fact', 'osfamily'], 'RedHat'],['!~', ['fact', 'pe_major_version'], '']],
    rule        => ['and', ['=', ['fact', 'osfamily'], 'RedHat'],['not',['~', ['fact', 'pe_major_version'], '.+']]],
    #classes     => {'role::windows_server' => {}},
  }
}
