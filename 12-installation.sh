#!/bin/bash

USERID=$(id - u)

if [ $USERID -eq 0 ]; then
    echo "ERROR:: Please run this script with root privelage"
    exit -1  #failur exit code is other than 0
fi

dnf install mysql -y

if [ $? -e 0 ]; then
    echo "ERROR:: Installing mysql is failure"
    exit -1
else 
    echo "Installing mysql is success"
fi

dnf install nginx -y

if [ $? -eq 0 ]; then
    echo "ERROR:: Installation nginx is failure:
else
    echo "Installating nginx is success"
fi

dnf install python3 -y

if [ $? -eq 0 ]; then
    echo "ERROR:: Installation python3 is failure:
else
    echo "Installating phtyon is success"
fi