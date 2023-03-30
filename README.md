# FolderMonitoring

This PowerShell script monitors a specified folder and waits for files to be added. Once a file is detected, the script logs the event and displays a message before pausing.

## Features

- Monitor a specified folder for new files
- Log detected files with a timestamp
- Display a progress bar during monitoring
- Alert when a file is detected

## Prerequisites

You will need PowerShell installed on your system.

## Usage

1. Open the script in a text editor.
2. Modify the `$Seconds` variable to set the interval (in seconds) to monitor the folder.
3. Save the changes and run the script in PowerShell.
4. When prompted, enter the folder path you want to monitor.

## Example

For example, to monitor the folder every 5 seconds, you would configure the script like this:

```powershell
$Seconds = 5 # Interval of seconds to monitor.
```


## Script Overview

The script runs in a loop, monitoring the specified folder. It uses `Get-ChildItem` to count the number of files in the folder. If there are no new files since the script started, it displays a progress bar and sleeps for the specified interval before checking again.

When a file is detected, the script logs the event with a timestamp in the specified log file (`log.log` by default) and exits the loop. It then displays a message indicating that a change has occurred.

## Log File

The log file (`log.log`) will be created in the same directory as the script. Each log entry includes a timestamp and the name of the detected file.

## Usage

```powershell
.\FolderMonitoring.ps1
```

## License

MIT

## Author

Kenta Goto
