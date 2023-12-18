#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if[ $? -ne 0 ]
    then
    echo "Error:installing  failed"
    exit 1
    else
    echo "installling  is sucess"
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

VALIDATE