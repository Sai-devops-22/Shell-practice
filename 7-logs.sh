#/bin/bash

USER=$(id -u)
R="e\[31m"
G="e\[32m"
LOG_FOLDER="var/log/shellpractice-log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOG_FOLDER
echo "THE EXECUTION START TIME: $(date)" &>>$LOG_FILE

#This is to check the root user or not
if [ $USER -ne 0 ]
then 
    echo "ERROR:: run with root access" &>>$LOG_FILE
    exit 1 #to stop the function if error exsit. give upto 127 except 0
else
    echo "You are a root user" &>>$LOG_FILE
fi

#This is to check whether the mysql is installed or not. if not, install mysql

VALIDATE(){
    if [ $1 -eq 0 ]  #to check whether mysql is installed or not
    then 
        echo -e "INSTALLING $2....$G SUCCESS" &>>$LOG_FILE
    else
        echo -e "INSTALLING $2....$R FAILURE"  &>>$LOG_FILE
        exit 1
    fi
}

dnf list installed mysql  &>>$LOG_FILE #command to check the mysql installed or not.
if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed.....going to install" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE #command to install mysql
    VALIDATE $? "MYSQL"  #these will consider as parameters for VALIDATE function as $1,$2.see in top.
else
    echo -e "MYSQL is already $G installed"
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed.....going to install" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx is already $G installed" &>>$LOG_FILE
fi
