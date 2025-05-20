#!/bin/bash

USER=$(id -u )

if [ $USER -ne 0 ]
then
    echo "ERROR:: you are not a user"
else
    echo "You are a root user"
fi