#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
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

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo "Mysql Package is already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo "nginx Package is already installed"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo "python3 Package is already installed"
fi
