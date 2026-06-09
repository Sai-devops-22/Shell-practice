#!/bin/bash

num1=10
num2=20

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
then
    echo "run with root user"
    exit 1
else
    echo "you are root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "already installed"
else
    echo "going to install"
    dnf install mysql -y

    if [ $? -ne 0 ]
    then
        echo "mysql sucessfully installed"
    else
        echo "ERROR:: something went wrong"
        exit 1
    fi
fi