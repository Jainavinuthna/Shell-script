#!/bin/bash

ID=$(id -u)

echo "scriptname: $0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "Error:$2  failed"
    exit 1
    else
    echo "$2 is sucess"
    fi
}

if [ $ID -ne 0 ]
then
echo "Error:please run with root user"
exit 1
else
echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "installing mysql"

yum install git -y

VALIDATE $? "installing git"