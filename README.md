# Windows Server Log Monitoring & Alert System

A PowerShell-based monitoring script designed to analyze Windows Security Event Logs and flag suspicious activity, including brute-force attacks, account lockouts, and privilege escalation attempts.

## 🔍 Overview

This project simulates a lightweight security monitoring pipeline for Windows servers. It parses system logs for common attack patterns and can be integrated with Splunk or other SIEM tools for alerting and visualization.

## ⚙️ Features

- Detects brute-force login attempts using Event ID 4625
- Flags account lockouts via Event ID 4740
- Identifies privileged logons with Event ID 4672
- Outputs matchable data for forwarding to SIEM/Splunk
- Simple to deploy as a scheduled task or in hybrid log environments

## 📁 File Structure

- `monitor-logs.ps1`: Core PowerShell script to analyze logs
- `sample-events.evtx`: Optional placeholder for test logs
- `alerts/`: (Optional) Folder for exporting matched logs

## 🧠 Technologies Used

- PowerShell 5.1+
- Windows Event Log
- Splunk (target SIEM for integration)
- Basic regex and event parsing

## 🚀 Sample Output

Brute-force login failure detected: 5/27/2025 01:22:13 PM - An account failed to log on.
Account lockout detected: 5/27/2025 01:30:08 PM - A user account was locked out.
Privileged account logon detected: 5/27/2025 01:35:22 PM - Special privileges assigned to new logon.


## 🔐 Note

This project is for demonstration purposes. Real-world integration would include forwarding logs to a central SIEM or setting alert thresholds.
