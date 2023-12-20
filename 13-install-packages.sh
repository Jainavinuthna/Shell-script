#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
if [ $1 -ne 0 ]
then 
echo -e"$2..installion $R FAILED"
else
echo -e"$2..installation $G SUCESS"
fi
}
if [ $ID -ne 0 ]
then
echo -e "$R Error:please run with root user $N"
exit 1
else
echo -e "you are $G root user"
fi

#echo "All args passed: $@"

for package in $@
do
  yum list installed $package
  if [ $? -ne 0 ]
  then 
      yum install $package -y
      VALIDATE $? "installation of $package"

done      
