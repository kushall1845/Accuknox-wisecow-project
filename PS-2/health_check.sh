#!/bin/bash

# Application URL (change this to your app's endpoint)
APP_URL="http://localhost:8080"  # Replace with your app URL when ready

# Log file
LOG_FILE="/var/log/app_uptime.log"

# Timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Send HTTP request and get status code
status_code=$(curl -s -o /dev/null -w "%{http_code}" --insecure "$APP_URL")

# Determine status
if [[ "$status_code" -ge 200 && "$status_code" -lt 400 ]]; then
  echo "[$timestamp] Application is UP (HTTP $status_code)" | tee -a "$LOG_FILE"
else
  echo "[$timestamp] ALERT: Application is DOWN (HTTP $status_code)" | tee -a "$LOG_FILE"
fi