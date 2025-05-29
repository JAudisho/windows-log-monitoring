# monitor-logs.ps1

# Create alerts folder if it doesn't exist
$alertPath = "alerts"
if (-not (Test-Path $alertPath)) {
    New-Item -ItemType Directory -Path $alertPath | Out-Null
}

# Output file for alerts
$outputFile = Join-Path $alertPath "alert-log.txt"
New-Item -Path $outputFile -ItemType File -Force | Out-Null
Add-Content -Path $outputFile -Value "==== Security Alerts ===="

# Simulate reading the Security Event Log
$events = Get-WinEvent -LogName Security -MaxEvents 1000

foreach ($event in $events) {
    $eventId = $event.Id
    $timestamp = $event.TimeCreated
    $message = $event.Message.Substring(0, [Math]::Min(60, $event.Message.Length))

    switch ($eventId) {
        4625 {
            $alert = "Brute-force login failure: $timestamp - $message"
        }
        4740 {
            $alert = "Account lockout: $timestamp - $message"
        }
        4672 {
            $alert = "Privileged account logon: $timestamp - $message"
        }
        default {
            continue
        }
    }

    Write-Output $alert
    Add-Content -Path $outputFile -Value $alert
}