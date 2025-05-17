#!/bin/bash

NUMBER1=$1
if ($NUMBER1 -ln 10)
then 
    echo "Then $NUMBER1 is less then 10"
else
    echo "The $NUMBER1 is greater than 10"
fi

