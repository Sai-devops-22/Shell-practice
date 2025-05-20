#/bin/bash

#This is to check the root user or not
USER=$(id -u)

if [ $USER -ne 0 ]
then 
    echo "ERROR:: run with root access"
    exit 1 #to stop the function if error exsit. give upto 127 except 0
else
    echo "You are a root user"
fi

#This is to check whether the mysql is installed or not. if not, install mysql

dnf list installed mysql  #command to check the mysql installed or not.
if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed.....going to install"
    dnf install mysql -y #command to install mysql

    if [ $? -eq 0 ]  #to check whether mysql is installed or not
    then 
        echo "INSTALLING MYSQL....SUCCESS"
    else
        echo "INSTALLING MYSQL....FAILURE"  
        exit 1
    fi

else
    echo "MYSQL is already installed"
fi

