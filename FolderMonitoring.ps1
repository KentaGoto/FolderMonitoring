$Seconds = 5 # Interval of seconds to monitor.
$Path = "\\nf-srv\temp\goto\test\t" # Path to monitor.
$Dots = "" # Progress mark "*".

while ($true) {
    Clear-Host
    Write-Host "Monitoring..."
    Write-Host

    $FileCount = (Get-ChildItem -Path $Path | Measure-Object).Count
    if ($FileCount -eq 0) {
        $Dots += "*"
        Write-Host $Dots
        Start-Sleep -Seconds $Seconds
    } else {
        break
    }
}

Write-Host ""
Write-Host "┏━━━━━━━━━━━━━━━━━━━━━┓"
Write-Host "┃It has been placed!!!┃"
Write-Host "┗━━━━━━━━━━━━━━━━━━━━━┛"
Write-Host

Pause