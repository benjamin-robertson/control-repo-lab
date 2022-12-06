# Check noop is set
if ( $env:PT__noop -eq "true" )
{
    echo "Running in noop: bailing out"
    exit 0
}

# Remove certs
& 'C:\Program Files\Puppet Labs\Puppet\bin\puppet' ssl clean

# Remove ca cert and crl
rm C:\ProgramData\PuppetLabs\puppet\etc\ssl\certs\ca.pem
rm C:\ProgramData\PuppetLabs\puppet\etc\ssl\crl.pem

# Restart Puppet service
Restart-Service puppet

# Lets see if we can get away without restarting pxp agent, maybe task will complete with success.
#Restart-Service pxp-agent
exit 0