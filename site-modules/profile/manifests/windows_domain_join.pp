# Class: profile::windows_domain_join
#
# Join servers to the lab.local domain.
#
class profile::windows_domain_join (
  String $domain_name,
  String $domain_bind_user,
  #Sensitive $domain_bind_password,
  Array $dns_server_addresses,
) {
  $domain_bind_password = Sensitive(lookup('profile::windows_domain_join::domain_bind_password'))
  # Setup DNS servers
  $interfaces = $facts['networking']['interfaces']
  $interfaces.each | String $name, Hash $hash | {
    dsc_dnsserveraddress { 'AD DNS':
      dsc_address        => $dns_server_addresses,
      dsc_addressfamily  => 'IPv4',
      dsc_interfacealias => $name,
      before             => Dsc_computer['domain join'],
    }
  }

  # Join the domain
  dsc_computer { 'domain join':
    dsc_domainname  => $domain_name,
    dsc_description => 'Joined to domain by Puppet',
    dsc_credential  => { 'user' => $domain_bind_user, 'password' => $domain_bind_password },
    dsc_name        => $facts['hostname'],
    validation_mode => 'resource',
  }
}
