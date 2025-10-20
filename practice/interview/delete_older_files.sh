#!/bin/bash

# a=0

# while [ $a -lt 10 ];
# do
#     echo $a
#     ((a++))
# done

set -e
failure(){
    echo "$1 $2 issue"
}

trap 'failure "${LINEND}" "${BASH_COMMAND}"' ERR


SOURCE_DIR=/home/ec2-user/apps
file_to_delete=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r filepath 
do
    echo "Deleting $filepath whick is older than 14 days...."
    rm -rf $filepath
done <<< $file_to_delete

