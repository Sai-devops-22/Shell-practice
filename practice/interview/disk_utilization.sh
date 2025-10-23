#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6f}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7f}')
    if [ "$USAGE" -ge "$DISK_THRESHOLD" ]
    then 
        echo -e "$PARTITION: $USAGE \n"
    else
        echo "everything is fine $line"
    fi
done <<< $DISK_USAGE