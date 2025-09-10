#!/bin/bash

LOG_FILE="/var/log/resource_alerts.log"

echo "Monitoring CPU and Memory usage every 5 seconds. Press Ctrl+C to stop."

while true; do
    # Get CPU usage (user + system)
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    # Get Memory usage (%)
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

    # Check CPU threshold
    if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
        echo "$TIMESTAMP ALERT: High CPU usage detected - ${CPU_USAGE}% " | tee -a $LOG_FILE
    fi

    # Check Memory threshold
    if (( $(echo "$MEM_USAGE > 90" | bc -l) )); then
        echo "$TIMESTAMP ALERT: High Memory usage detected - ${MEM_USAGE}% " | tee -a $LOG_FILE
    fi

    sleep 5
done
