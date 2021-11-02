class profile::base_pe_master {
  # Base for puppet enterprise master. Sets up things like autosign and will do 
  # node groups and classifciations
  include profile::pe_master::puppet_settings
  include profile::pe_master::autosign
  #include profile::pe_master::node_classify
}
