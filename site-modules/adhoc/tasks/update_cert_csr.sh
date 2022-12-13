#!/bin/bash

if [ $PT__noop == "true" ]
then
  echo "Running in noop mode: bailing out"
  exit 0
fi

if [ $PT_noop == "true" ]
then
  echo "Running in noop mode: bailing out"
  exit 0
fi

# Remove certs
/opt/puppetlabs/bin/puppet ssl clean

# Remove ca cert and crl
rm -f /etc/puppetlabs/puppet/ssl/certs/ca.pem
rm -f /etc/puppetlabs/puppet/ssl/crl.pem

# Restart Puppet service
/bin/systemctl restart puppet.service

# Lets see if we can get away without restarting pxp agent, maybe task will complete with success.
/bin/systemctl restart pxp-agent.service
exit 0