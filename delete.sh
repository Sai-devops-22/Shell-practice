#!/bin/bash

FILE='/home/ec2-user/app-logs'
#DELETE=$(find $FILE -name "*.log" -mtime +14 -delete)

DELETE=$(find "$FILE" -type f -name "*.log" -mtime +14 -delete)