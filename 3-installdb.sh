#/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
    echo "ERROR:: run with root access"
    exit 1 #to stop the function if error exsit. give upto 127 except 0
else
    echo "You are a root user"
fi

dnf install mysql -y 

if [ $? eq 0 ]  #to check whether mysql is installed or not
then 
    echo "INSTALLING MYSQL....SUCCESS"
else
    echo "INSTALLING MYSQL....FAILURE"
    exit 1
fi