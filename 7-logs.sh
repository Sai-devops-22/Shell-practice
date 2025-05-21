#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
    echo "You are not a root user"
    exit 1
else
    echo "You are in root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL not installed"
    exit 1
else
    echo "MYSQL ALREDY INSTALLED"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "MYSQL  INSTALLED.....success"
else
    echo "MYSQL not installed..failed"
    exit 1
fi