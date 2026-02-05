#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 logfile"
    exit 1
fi

if [ ! -r "$1" ]; then
    echo "Error: File not readable or does not exist."
    exit 1
fi

total=$(grep -c "INFO\|ERROR\|WARNING" "$1")
info=$(grep -c "INFO" "$1")
warning=$(grep -c "WARNING" "$1")
error=$(grep -c "ERROR" "$1")

recent_error=$(grep "ERROR" "$1" | tail -1)

echo "Total entries: $total"
echo "INFO: $info"
echo "WARNING: $warning"
echo "ERROR: $error"
echo "Most recent ERROR: $recent_error"

report="logsummary_$(date +%Y%m%d).txt"

{
echo "Log Summary"
echo "Total: $total"
echo "INFO: $info"
echo "WARNING: $warning"
echo "ERROR: $error"
echo "Recent ERROR: $recent_error"
} > $report
