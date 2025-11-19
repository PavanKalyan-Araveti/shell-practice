#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelage"
    exit -1  #failur exit code is other than 0
fi

VALIDATE(){ #function receive inputs through args just like shell script
    if [ $1 -e 0 ]; then
        echo -e "ERROR:: Installing $2 is $R FAILURE $N"
        exit -1
    else 
        echo -e "Installing $2 is $G success $N"
    fi    
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo -e "Mysql Package is already exits..... $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo -e "nginx Package is already exits..... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo -e "python3 Package is already exits..... $Y SKIPPING $N"
fi
