Invoke-Script   Analyzer -Recurse -Path /repo -ReportSummary > output.txt
$tem p = Get-content output.txt -Raw
Write-Ou tput $temp.Trim().Replace(" ", ".")