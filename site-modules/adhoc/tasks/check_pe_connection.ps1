# Check connection to PE server using Powershell for windows.
$PT_target_pe_server=$env:PT_target_pe_server
echo $PT_target_pe_server
if (Test-NetConnection -ComputerName $PT_target_pe_server -Port 8140 -InformationLevel quiet) 
{
    echo "port 8140 successful"
} else {
    echo "port 8140 unsucessful"
    exit 1
}

if (Test-NetConnection -ComputerName $PT_target_pe_server -Port 8142 -InformationLevel quiet) 
{
    echo "port 8142 successful"
} else {
    echo "port 8142 unsucessful"
    exit 1
}

exit 0