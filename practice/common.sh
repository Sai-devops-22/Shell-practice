#!/bin/bash

# R="\e[31m"
# USER_ID=$(id -u)
# LOG_PATH="/var/log/roboshop_log"
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# LOG_FILE=$LOG_PATH/$SCRIPT_NAME."log"
# mkdir -p $LOG_FOLDER

# if [ $USER_ID -ne 0 ]
# then
#     echo "you are not a root user"
#     exit 1
# else    
#     echo "you are root user"
# fi


# VALIDATE(){
#     if [ $1 -ne 0 ]
#     then
#         echo "$1 issue exist"
#         exit 1
#     else
#         echo "$2 sucessful..."
# }

# dnf module disable nodejs -y
# VALIDATE $? "disabling"

# dnf module enable nodejs:20 -y
# VALIDATE $? "enabling"

# dnf install nodejs -y
# VALIDATE $? "installing"

# id roboshop
# if [ $? -ne 0 ]
# then
#     useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop
#     VALIDATE $? "ID"
# else
#     echo -e "already id exist"
# fi

# rm -rf /app/*
# mkdir /app
# A

echo "hey hi"