#!/bin/bash

SOURCE_FILE='/home/ec2-user/app-logs'
BACKUP_FILE='/home/ec2-user/backup-logs'

#find "$SOURCE_DIR" -type f -mtime +14 -exec mv {} "$DELETED_DIR" \;


#!/bin/bash

# Set the directory where your files are stored
SOURCE_DIR="/home/ec2-user/app-logs"

# Set the directory where old files will be moved (instead of deleted)
DELETED_DIR="/home/ec2-user/deleted-files"

# Create the deleted folder if it doesn't exist
mkdir -p "$DELETED_DIR"

# Find files older than 14 days and move them to the deleted folder
find "$SOURCE_DIR" -type f -mtime +14 -exec mv {} "$DELETED_DIR" \;

echo "✅ Files older than 14 days have been moved to: $DELETED_DIR"
