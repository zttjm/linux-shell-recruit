#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
if [[ $# -eq 0 ]]; then
    echo "Usage: ./scripts/analyze.sh FILE"
    exit 1
fi
# TODO: validate file existence
if [[ ! -f "$1" ]]; then
    echo "Error: File '$1' not found or is not a regular file."
    exit 1
fi
# TODO: print:
# Total ERROR: <number>
error_count=$(grep -c "ERROR" "$1")
echo "Total ERROR: ${error_count}"
# Top Code: <code>
top_code=$(cut -d ' ' -f 5 "$1" | cut -d '=' -f 2 | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
echo "Top Code: ${top_code}"
exit 0
