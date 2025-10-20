#!/bin/bash

SOURCE_DIR=/home/ec2-user/source_dir
DEST_DIR=/home/ec2-user/dest_dir

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14 )

if [ ! -z $FILES ]  #if the files are not empty or use -n 
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

