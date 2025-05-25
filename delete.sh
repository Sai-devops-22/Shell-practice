# #!/bin/bash

#PRINT THE OU[UT WITH PATH
FILE='/home/ec2-user/app-logs'


DELETE=$(find "$FILE" -type f -name "*.log" -mtime +14 -print -delete)
echo $DELETE

#PRINT THE OUTPUT ONT THE FILE NAME
FILE_PATH='/home/ec2-user/app-logs'
DELETE=$(find "$FILE_PATH" -type f -name "*.log" -mtime +14 -exec basename {} \; -delete) 
echo $DELETE

#DELETE=$(find $FILE -name "*.log" -mtime +14 -delete)