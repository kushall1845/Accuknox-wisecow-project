# 🛠️ Linux System Monitoring & Application Uptime Scripts

This repository contains two Bash scripts designed to enhance system reliability and observability in Linux environments.

---

## 1️⃣ System Health Monitoring Script

**Objective:**  
Monitor the health of a Linux system by checking the following metrics:
- CPU usage
- Memory usage
- Disk space
- Running processes

**Behavior:**  
If any metric exceeds predefined thresholds (e.g., CPU usage > 80%), the script will:
- Print an alert to the console, or
- Log the alert to a file for further analysis



## 2️⃣ Application Uptime Checker

**Objective:**  
Check the uptime and availability of an application by:
- Sending HTTP requests to the application's endpoint
- Evaluating the returned HTTP status codes

**Behavior:**  
- If the application responds with a valid status code (e.g., `200 OK`), it is considered **'up'**
- If it fails to respond or returns an error code, it is considered **'down'**


