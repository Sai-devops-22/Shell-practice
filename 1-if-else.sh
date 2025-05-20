#!/bin/bash

NUMBER1=$1

if [ $NUMBER1 -lt 10 ]
then 
    echo "the $NUMBER1 is less than 10"
else
    echo "the $NUMBER1 is greater than 10"
fi
