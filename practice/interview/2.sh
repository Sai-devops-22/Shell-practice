#!/bin/bash

# num1=10
# num2=20

# USER_ID=$(id -u)

# if [ $USER_ID -ne 0 ]
# then
#     echo "run with root user"
#     exit 1
# else
#     echo "you are root user"
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "going to install"
#     dnf install mysql -y

#     if [ $? -eq 0 ]
#     then
#         echo "mysql sucessfully installed"
#     else
#         echo "ERROR:: something went wrong"
#         exit 1
#     fi
# else
#     echo "already installed"
# fi

#!/bin/bash

# set -e

# cleanup() {
#     echo "Removing temp file"
#     rm -f /tmp/myfile
# }

# trap cleanup EXIT

# touch /tmp/myfile

# ls /does/not/exist


# USER=$(id -u)
# DATE=$(date)
# R="\e[31m"
# G="\e[31m"
# LOG_FOLDER="var/log/shellpractie_log"
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# LOG_PATH="$LOG_FOLDER/$SCRIPT_NAME.log"

# mkdir -p $LOG_FOLDER

# echo "the script executes at $(date)" | tee -a $LOG_PATH

# VALIDATE (){
#     if [ $1 -ne 0 ]
#     then 
#         echo -e "$2 execution $R fail" | tee -a $LOG_PATH
#         exit 1
#     else
#         echo -e "$2 going to $G install" | tee -a $LOG_PATH
#     fi    
# }

# dnf installed nginx 

# if [ $? -ne 0 ]
# then 
#     echo -e "the software is not installed, going to install"
#     dnf install nginx -y
#     VALIDATE $? "nginx"
# else
#     echo "already installed"
# fi


set -u 

failure(){
    echo "there an issue $1:$2"
}

trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR

USER=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

SOURCE_DIR=/home/ec2-user/source_dir
DEST_DIR=/home/ec2-user/dest_dir

FILES=$(find "$SOURCE_DIR" -name "*.log" -mtime +13)


if [ ! -d "$SOURCE_DIR" ]
then
    echo "there is no such source_directory"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo "there is no such dest_directory, going to create"
    mkdir -p "$DEST_DIR"    

fi

if [ ! -z "$FILES" ]
then
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP="$DEST_DIR/$TIMESTAMP.log"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip -@ $ZIP

    while IFS= read -r filepath
    do
        rm -rf "$filepath"
    done <<< "$FILES"
else
    echo "there is no files under 14 days"
fi




