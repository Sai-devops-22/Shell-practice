#!/bin/bash

num1=10
num2=20

USER_ID=$(id -u)

if [ $USER_ID -ne 0]
then
    echo "run with root user"
    exit 1
else
    echo "you are root user"
fi

if [ $num1 -gt $num2]
then
    echo "the $num1 is bigger"
else
    echo "the $num2 is bigger"
fi