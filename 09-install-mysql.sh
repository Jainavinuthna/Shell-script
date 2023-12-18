#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
echo "Error:please run with root user"
exit 1
else
echo "you are root user"
fi

yum install mysql -y

if($? -ne 0)
then
echo "Error:installing mysql failed"
exit 1
else
echo " installling mysql is sucess"
fi

