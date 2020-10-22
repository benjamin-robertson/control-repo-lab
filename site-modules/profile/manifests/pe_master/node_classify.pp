class profile::pe_master::node_classify {
  node_group { 'Windows Hosts - auto':
    ensure      => 'present',
    environment => 'production',
    rule       => ['and', ['=', ['fact', 'osfamily'], 'windows']],
    parent      => 'All Nodes',
  }
}
