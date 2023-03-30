$Seconds = 5 # Interval of seconds to monitor.

# Prompt the user for the folder path.
Write-Host "Folder: "
$Path = Read-Host

# Specify the log file path.
$LogFilePath = "log.log"

$monitoring = $true
$FistFileCount = (Get-ChildItem -Path $Path | Measure-Object).Count
while ($monitoring) {
    $Files = Get-ChildItem -Path $Path
    $FileCount = (Get-ChildItem -Path $Path | Measure-Object).Count

    if ($FileCount -eq $FistFileCount) {
        for ($i = 0; $i -lt $Seconds; $i++) {
            $progressPercentage = ($i / $Seconds) * 100
            Write-Progress -Activity "Monitoring..." -Status "Waiting for files" -PercentComplete $progressPercentage
            Start-Sleep -Seconds 1
        }
    } else {
        $monitoring = $false

        # Log the detected files.
        foreach ($File in $Files) {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $logEntry = "$timestamp - File detected: $($File.Name)"
            Add-Content -Path $LogFilePath -Value $logEntry
        }
    }
}

Write-Progress -Activity "Monitoring..." -Status "File detected" -Completed

Write-Host ""
Write-Host "┏━━━━━━━━━━━━━━━━━┓"
Write-Host "┃ With changes!!! ┃"
Write-Host "┗━━━━━━━━━━━━━━━━━┛"
Write-Host

Pause