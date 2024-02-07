Invoke-ScriptAnalyzer -Recurse -Path /repo -ReportSummary > output.txt
$temp = Get-content output.txt -Raw
echo $temp.Trim().Replace(" ", ".")