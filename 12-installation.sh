#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "ERROR:: Please run this script with root privelage"
    exit -1  #failur exit code is other than 0
fi

VALIDATE(){ #function receive inputs through args just like shell script
    if [ $1 -e 0 ]; then
        echo "ERROR:: Installing $2 is failure"
        exit -1
    else 
        echo "Installing $2 is success"
    fi    
}
dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install python3 -y
VALIDATE $? "python3"