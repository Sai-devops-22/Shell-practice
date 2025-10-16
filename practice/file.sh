#!/bin/bash

# Person1=pradeep
# Person2=ravi

# echo "$Person1:: hey hi $Person2"
# echo "$Person2:: hi $Person1"

# values=("one"  "two", "three")
# echo "values are ${values[0]}"

# NUMBER1=$1
# NUMBER2=$2
# TIMESTAMP=$(date)
# echo ${TIMESTAMP}
# SUM=$((NUMBER1+NUMBER2))
# echo "the sum of two is $SUM"


USER_ID=$( id -u )
TIMESTAMP=$( date )

if [ $USER_ID -eq 0 ]
then
    echo "the script executed at $TIMESTAMP"
    echo "you are a root user"

else
    echo "the script executed at $TIMESTAMP"
    echo "you are not a root user"
    exit 1
fi  

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: there is an issue"
    exit 1
else
    echo "PASS:: sucessfully installed"


