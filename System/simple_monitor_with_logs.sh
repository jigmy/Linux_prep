#!/bin/bash
# simple_monitor_with_logs.sh

LOG_FILE="system_metrics.log"

while true; do
    # Create timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Collect metrics
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print (100 - $1)}')
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    
    # Save to log file
    echo "$timestamp,CPU:$cpu_usage%,MEM:$memory_usage%,DISK:$disk_usage%" >> $LOG_FILE
    
    # Display on screen
    clear
    echo "=== Simple System Monitor ==="
    echo "Time: $timestamp"
    echo "CPU Usage: $cpu_usage%"
    echo "Memory Usage: $memory_usage%"
    echo "Disk Usage: $disk_usage%"
    
    sleep 5
done
