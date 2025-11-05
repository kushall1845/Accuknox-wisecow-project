# Monitor Script Setup Guide

This guide explains how to set up and schedule the `monitor_script.sh` to run automatically every minute.

## Steps to Use

### 1. Save the Script
Open the script file in a text editor and save it to `/usr/local/bin`:
```bash
sudo vim /usr/local/bin/monitor_script.sh

### 2. Make It Executable
Grant execution permissions to the script:
```bash
chmod +x /usr/local/bin/monitor_script.sh

### 3. Run Manually or Schedule with Cron
```bash
monitor_script.sh

or

crontab -e

choose you favourite file editor

Add:
*/1 * * * * /usr/local/bin/monitor_script.sh

(the script get's executed for every 1 minute) 


