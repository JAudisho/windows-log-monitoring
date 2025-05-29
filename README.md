# Windows Server Log Monitoring & Alert System

This project monitors Windows Server event logs for suspicious activity using PowerShell. It detects patterns associated with brute-force attacks, privilege escalation, and repeated account lockouts, and logs them for incident response. Alerts are generated in real-time and optionally integrated into SIEM platforms such as Splunk.

## ⚙️ Features

- Parses and monitors Security event logs.
- Detects:
  - Brute-force login attempts
  - Account lockouts
  - Privilege escalation events (e.g., new admin users)
- Logs alerts into structured files
- Designed for use in Splunk or other SIEM pipelines
- Lightweight, easily customizable PowerShell script

## 📁 File Structure

- `monitor-logs.ps1`: Main PowerShell script
- `sample-events.evtx`: Sample logs for testing
- `alerts/`: Directory where alerts are written

## 🧠 Technologies Used

- PowerShell
- Windows Event Viewer (Security logs)
- Splunk-ready log output
- Sample `.evtx` logs included for testing

## 🚀 Sample Output

[ALERT] Brute-force attempt detected for user Administrator from IP 192.168.1.100
[ALERT] Multiple account lockouts for user svc_account
[ALERT] User added to Administrators group: temp_user

2. Launch the script in PowerShell:
.\monitor-logs.ps1

3. Monitor the `alerts/` folder for suspicious activity.
