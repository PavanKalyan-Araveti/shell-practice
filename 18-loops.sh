#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id - u)
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$LOG_FILE.log"
mkdir -p $LOGS_FOLDER
echo "Scripting started executing at : $(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilage"
    exit -1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR: Installation of $2 is $R Failure $N"
        exit 1
    else
        echo -e "Installation of $2 is $G success $N"
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE

    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else 
        echo -e "$package already installed $Y skipping $N"
    fi
done