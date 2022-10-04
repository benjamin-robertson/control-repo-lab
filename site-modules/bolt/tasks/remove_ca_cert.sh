#!/bin/bash

# check if we are running on a PE server
rpm -qa | grep pe-puppetserver
if [ $? -ne 0 ]
then
  echo "Bailing out: Running on PE server"
  exit 1
fi

# Remove ca cert
rm /etc/puppetlabs/puppet/ssl/certs/ca.pem
exit 0