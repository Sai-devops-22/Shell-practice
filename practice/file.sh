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


# USER=$(id -u)
# TIMESTAMP=$(date)

# if [ $USER -eq 0 ]
# then
#     echo "the script executed at $TIMESTAMP"
#     echo "you are a root user"

# else
#     echo "the script executed at $TIMESTAMP"
#     echo "you are not a root user"
#     exit 1
# fi

USER=$(id -u )

if [ $USER -ne 0 ]
then
    echo "ERROR:: you are not a user"
    exit 1
else
    echo "You are a root user"
fi