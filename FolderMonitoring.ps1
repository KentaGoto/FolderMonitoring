$Seconds = 5 # Interval of seconds to monitor.

Write-Host "Folder: "
$Path = Read-Host # Path to monitor.

$monitoring = $true
$FistFileCount = (Get-ChildItem -Path $Path | Measure-Object).Count
while ($monitoring) {
    $FileCount = (Get-ChildItem -Path $Path | Measure-Object).Count

    if ($FileCount -eq $FistFileCount) {
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