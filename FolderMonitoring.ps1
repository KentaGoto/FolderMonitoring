$Seconds = 5 # Interval of seconds to monitor.
$Path = "\\nf-srv\temp\goto\test\t" # Path to monitor.

$monitoring = $true
while ($monitoring) {
    $FileCount = (Get-ChildItem -Path $Path | Measure-Object).Count

    if ($FileCount -eq 0) {
        for ($i = 0; $i -lt $Seconds; $i++) {
            $progressPercentage = ($i / $Seconds) * 100
            Write-Progress -Activity "Monitoring..." -Status "Waiting for files" -PercentComplete $progressPercentage
            Start-Sleep -Seconds 1
        }
    } else {
        $monitoring = $false
    }
}

Write-Progress -Activity "Monitoring..." -Status "File detected" -Completed

Write-Host ""
Write-Host "┏━━━━━━━━━━━━━━━━━━━━━┓"
Write-Host "┃It has been placed!!!┃"
Write-Host "┗━━━━━━━━━━━━━━━━━━━━━┛"
Write-Host

Pause