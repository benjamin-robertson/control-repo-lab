#!/bin/bash

# check if we are running on a PE server
hostnamectl | grep 'Operating System: Ubuntu'

if [ $? -eq 0 ]
then
  echo 'ubuntu'
  command='dpkg -l'
else
  echo 'redhat'
  command='rpm -qa'
fi

$command | grep pe-puppetserver

if [ $? -eq 0 ]
then
  echo "Bailing out: Running on PE server"
  exit 1
fi

# Remove ca cert
rm /etc/puppetlabs/puppet/ssl/certs/ca.pem
exit 0