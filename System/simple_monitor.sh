#!/bin/bash
# simple_monitor.sh

while true; do
    clear
    echo "=== System Monitor ==="
    echo "Date: $(date)"
    echo ""
    
    echo "=== CPU Usage ==="
    top -bn1 | grep "Cpu(s)" | awk '{print $2}'
    
    echo ""
    echo "=== Memory Usage ==="
    free -h | awk '/Mem:/ {printf "%.2f%", $3/$2*100}'
    
    echo ""
    echo "=== Disk Usage ==="
    df -h / | awk '/\// {print $5}'
    
    echo ""
    echo "=== System Load ==="
    uptime
    
    echo ""
    echo "=== Top 5 CPU Processes ==="
    ps aux | sort -nr -k 3 | head -6
    
    sleep 5  # Update every 5 seconds
done
