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

# check if connectivity check is bypassed
if [ $PT_bypass_connectivity_check == "true" ]
then
  echo "Connectivity check bypassed"
  exit 0
fi

# Confirm curl is installed
which curl
if [ $? -eq 0 ]
then
  # check port 8140
  curl $PT_target_pe_server:8140 -I
  if [ $? -ne 8 ]
  then
    echo "Port 8140 not open"
    exit 1
  fi

  # Check port 8140
  curl $PT_target_pe_server:8142 -I
  if [ $? -ne 8 ]
  then
    echo "Port 8142 not open"
    exit 1
  fi

  # both ports successful, return 0
  echo "Port 8140 and 8142 avaliable."
  exit 0
else
  echo "curl not found, failing test"
  exit 1
fi