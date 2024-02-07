Invoke-ScriptAnalyzer -Recurse -Path /repo -ReportSummary > output.txt
$temp = Get-content output.txt -Raw
Write-Output $temp.Trim().Replace(" ", ".")