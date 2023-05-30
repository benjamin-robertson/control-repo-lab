# Installs windows feature
$PT_windows_feature=$env:PT_windows_feature 

$feature_status=get-windowsfeature -name $PT_windows_feature

if ($feature_status.InstallState -ne "Installed") {
    Install-WindowsFeature -Name $PT_windows_feature
}