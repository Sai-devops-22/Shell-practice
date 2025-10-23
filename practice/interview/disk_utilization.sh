#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
threshold=1

while IFS= read -r line
do
    echo "disk usage alert $line"
    usage=$(df -hT | grep -v Filesystem | awk '{print $6f}' | cut -d "%" -f1)
    partition=$(df -hT | grep -v Filesystem | awk '{print $7f}')
    echo "$partition:$usage"
done <<< $disk_usage