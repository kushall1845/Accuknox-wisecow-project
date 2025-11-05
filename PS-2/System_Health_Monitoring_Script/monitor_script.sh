#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
PROC_THRESHOLD=300

# Log file
LOG_FILE="/var/log/system_health.log"

# Timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# CPU usage (%)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
cpu_usage_int=${cpu_usage%.*}

# Memory usage (%)
mem_usage=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')

# Disk usage (% of root)
disk_usage=$(df / | awk 'END{print $5}' | tr -d '%')

# Running processes
proc_count=$(ps aux --no-heading | wc -l)

# Function to log alerts
log_alert() {
  echo "[$timestamp] ALERT: $1" | tee -a "$LOG_FILE"
}

# Checks
[[ $cpu_usage_int -gt $CPU_THRESHOLD ]] && log_alert "High CPU usage: ${cpu_usage_int}%"
[[ $mem_usage -gt $MEM_THRESHOLD ]] && log_alert "High Memory usage: ${mem_usage}%"
[[ $disk_usage -gt $DISK_THRESHOLD ]] && log_alert "High Disk usage: ${disk_usage}%"
[[ $proc_count -gt $PROC_THRESHOLD ]] && log_alert "High Process count: ${proc_count}"

# Optional: log healthy status
echo "[$timestamp] System check complete. CPU: ${cpu_usage_int}%, MEM: ${mem_usage}%, DISK: ${disk_usage}%, PROCS: ${proc_count}" >> "$LOG_FILE"