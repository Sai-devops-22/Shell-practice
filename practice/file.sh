#!/bin/bash

#basics:
#########
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
# R="\e[31m"
# G="\e[32m"
# B="\e[34m"
# N="\e[0m"

# USER_ID=$( id -u )
# TIMESTAMP=$( date )
# LOG_FOLDER="/var/log/shell-practice_log"
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
# mkdir -p $LOG_FOLDER

# if [ $USER_ID -eq 0 ]
# then
#     echo "the script executed at $TIMESTAMP" | tee -a $LOG_FILE
#     echo "you are a root user"

# else
#     echo "the script executed at $TIMESTAMP"
#     echo "you are not a root user"
#     exit 1
# fi  

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "the software is not installed. need to install"
#     exit 1
# else
#     echo "the software is already installed"
# fi

# dnf install mysql -y

# if [ $? -ne 0 ]
# then 
#     echo "ERROR:: there is an issue"
#     exit 1
# else
#     echo "PASS:: sucessfully installed"
# fi


# VALIDATE(){
#     if [ $1 -eq 0 ]
#     then 
#         echo "the software $2 is installed"
#     else    
#         echo "the software $2 is not installed,there is an issue"
#         exit 1
#     fi
# }


# dnf list installed mysql
# if [ $? -ne 0 ]
# then 
#     echo "mysql is not installed, going to install" | tee -a $LOG_FILE
#     dnf install mysql -y  &>>$LOG_FILE
#     VALIDATE $? "MYSQL"    
# else
#     echo -e "$G already installed $N"
# fi

# dnf list installed nginx
# if [ $? -ne 0 ]
# then
#     echo "the software is not installed, going to install"
#     dnf install nginx -y
#     VALIDATE $? "nginx"
# else    
#     echo -e "$G the software is already installed $N"
# fi

# dnf list installed python3
# if [ $? -ne 0]
# then    
#     echo "the software is not installed"
#     dnf install python3 -y 
#     VALIDATE $? "python3"
# else    
#     echo -e "$G already installed $N"
# fi


# dnf list installed nginx
# if [ $? -ne 0 ]
# then
#     echo "nginx is not installed... going to install it"
#     dnf install nginx -y
#     VALIDATE $? "nginx"
# else
#     echo "nginx is already installed...Nothing to do"
# fi


#######################################################################################
#loops:
set -e

failure(){
    echo "$1 $2 issue"
}
trap 'failure "${LINEND}" "${BASH_COMMAND}"' ERR

R="\e[31m"
G="\e[32m"
B="\e[34m"

LOG_FOLDER="/var/log/shell_log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=$LOG_FOLDER/$SCRIPT_NAME."log"

mkdir -p $LOG_FOLDER

PACKAGES=("python" "nginx")

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "installing $2..." | tee -a $LOG_FILE
    else
        echo "there is an issue..."
    fi
}

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
then
    echo "you are not a root user"
    exit 1
else
    echo "you are root user"
fi

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        dnf install $package &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo "it is already exist"
    fi
done


