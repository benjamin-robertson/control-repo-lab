# Class: profile::windows_domain_join
#
# Join servers to the lab.local domain.
#
class profile::windows_domain_join (
  String $domain_name,
  String $domain_bind_user,
  String $domain_bind_password,
  Array $dns_server_addresses,
) {
  # Setup DNS servers
  $interfaces = dig($facts['networking'], ['interfaces'])
  notify { "My interfaces are ${interfaces}": }
  #dsc_dnsserveraddress { 'AD DNS':
  #  dsc_address       => $dns_server_addresses,
  #  dsc_addressfamily => 'IPv4',

  #}
}
