# monitor-logs.ps1

$logName = "Security"
$alertDir = "alerts"
if (!(Test-Path $alertDir)) {
    New-Item -Path $alertDir -ItemType Directory | Out-Null
}

# Load event logs
$events = Get-WinEvent -LogName $logName -MaxEvents 1000

foreach ($event in $events) {
    $msg = $event.Message
    $id = $event.Id

    # Brute-force login detection (Event ID 4625)
    if ($id -eq 4625 -and $msg -match "Account Name:\s+(\S+)") {
        $username = $matches[1]
        $alert = "[ALERT] Brute-force attempt detected for user $username"
        Add-Content -Path "$alertDir\\brute_force.log" -Value $alert
    }

    # Account lockout detection (Event ID 4740)
    elseif ($id -eq 4740 -and $msg -match "Account Name:\s+(\S+)") {
        $lockedUser = $matches[1]
        $alert = "[ALERT] Account locked out: $lockedUser"
        Add-Content -Path "$alertDir\\account_lockouts.log" -Value $alert
    }

    # Privilege escalation detection (Event ID 4732)
    elseif ($id -eq 4732 -and $msg -match "Member Name:\s+(\S+)") {
        $newAdmin = $matches[1]
        $alert = "[ALERT] User added to Administrators group: $newAdmin"
        Add-Content -Path "$alertDir\\privilege_escalation.log" -Value $alert
    }
}