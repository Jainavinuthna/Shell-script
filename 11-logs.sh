#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "Error:$2..$R  failed"
    exit 1
    else
    echo -e "$2 is $G sucess"
    fi
}

if [ $ID -ne 0 ]
then
echo -e "Error:please run with root user"
exit 1
else
echo -e "you are root user"
fi

yum install mysql -y &>>$LOGFILE 

VALIDATE $? "installing mysql"

yum install git -y &>>$LOGFILE

VALIDATE $? "installing git"