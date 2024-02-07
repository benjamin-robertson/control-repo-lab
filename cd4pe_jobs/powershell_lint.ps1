pwsh --command Invoke-ScriptAnalyzer -Recurse -EnableExit -Path /repo -ReportSummary > output.txt 
$Scriptanalyzer_code = $LASTEXITCODE
$temp = Get-content output.txt -Raw
Write-Output $temp.Trim().Replace(" ", ".")
if ( $Scriptanalyzer_code -eq 0  ) {
    exit 0
  } else {
    exit 1
}