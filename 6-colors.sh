#/bin/bash

R="e\[31m"
G="e\[32m"
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

VALIDATE(){
    if [ $1 -eq 0 ]  #to check whether mysql is installed or not
    then 
        echo -e "INSTALLING $2....$G SUCCESS"
    else
        echo -e "INSTALLING $2....$R FAILURE"  
        exit 1
    fi
}

dnf list installed mysql  #command to check the mysql installed or not.
if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed.....going to install"
    dnf install mysql -y #command to install mysql
    VALIDATE $? "MYSQL"  #these will consider as parameters for VALIDATE function as $1,$2.see in top.
else
    echo -e "MYSQL is already $G installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed.....going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx is already $G installed"
fi


#OVERALL:-

# 1.first check the user
# 2.check command dnf list installed mysql
# 3.if not, install mysql with "dnf install mysql -y" command
# 4.to stop repeating lines keep all the dnf install conditional statements in VALIDATED function and pass 
# the parameters $? value and "software" as $1 and $2.

#OVERALL:-

# 1.first check the user
# 2.check command dnf list installed mysql
# 3.if not, install mysql with "dnf install mysql -y" command
# 4.to stop repeating lines keep all the dnf install conditional statements in VALIDATED function and pass 
# the parameters $? value and "software" as $1 and $2.