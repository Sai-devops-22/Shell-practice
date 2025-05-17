#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERR0R! Please enter into root user"
    exit 1
else
    echo "you are in root user"
fi
