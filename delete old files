#!/bin/bash

FILE='/home/ec2-user/app-logs'
DELETE=$(find $FILE -name "*.log" -mtime +14 -delete)

while IFS= read -r filepath
do
    $DELETE
done