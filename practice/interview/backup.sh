#!/bin/bash

SOURCE_DIR=/home/ec2-user/source_dir
DEST_DIR=/home/ec2-user/dest_dir

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14 )

if [ -n $FILES ]  #if the files are not empty or use -n 
then
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP="$DEST_DIR/apps/$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip -@ "$ZIP"  #moving the files from source to dest

    if [ -f $ZIP ]
    then
        echo "created zip files"

        while IFS= read -r filepath;
        do
            rm -rf $filepath
        done <<< $FILES
    else
        echo "zip file creation error"
    fi
else
    echo "no files found lolder than 14"
fi


# 1.create two paths source and dest
# 2.find command for file older than 14 days
# 3.if condition, if files are not empty that means if there is any file exsisting older than 14days
# 4.id exist give time, zip path and zip path
# 5.if -f (is for files) created in zip remove files

# here first we are moving the files to zip and then deleting the files

# [ ! -z $FILES ]         # should be: [ -n "$FILES" ] space issue in files
# [ -f $ZIP ]             # should be: [ -f "$ZIP" ] better to use ""
# rm -rf $filepath        # should be: rm -f "$filepath" rm -f for files and rm -rf for directory
