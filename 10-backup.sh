#!/bin/bash

USER_ID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3: 14} #it will take 14 default if the days are not given

check_root(){
    if [ $USER_ID -ne 0 ]
    then
        echo "BE IN ROOT ACCESS"
        exit 1
    else
        echo "YOU ARE IN ROOT ACCESS"
    fi
}

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$1 IS SUCESS...."
    else
        echo "$2 IS FAILED...."
        exit 1
}

USAGE(){
    echo "THE WAY TO ADD THE FILE <source-file> <destination-file> <days>"
}

if [ $# -ne 2 ]
then
    USAGE()
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "the source file does not exist"
else
    eccho "the source file exist"
fi


if [ ! -d $DEST_DIR ]
then
    echo "the destination directory does not exist"
else
    echho "the destination file exist"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime + $DAYS)

if [ ! -z $FILES ]
then
    echo "FILES ARE EXSIST $FILES"
else
    echo " FILES ARE NOT EXIST"
fi