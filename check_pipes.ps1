$pipes = [System.IO.Directory]::GetFiles("\\.\pipe\")
$dockerPipes = $pipes | Where-Object { $_ -like '*docker*' }
if ($dockerPipes.Count -gt 0) {
    Write-Host "Docker pipes found:"
    $dockerPipes | ForEach-Object { Write-Host $_ }
} else {
    Write-Host "No docker pipes found"
    Write-Host "All pipes:"
    $pipes | ForEach-Object { Write-Host $_ }
}
