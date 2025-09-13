#!/bin/bash
echo "System Information for: $(hostname)"
echo "----------------------------------"
echo "Uptime: $(uptime -p)"
echo
echo "Disk usage:"
df -h | grep -E '^Filesystem|/dev/'
echo
echo "Memory usage:"
free -h
