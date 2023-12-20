#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started excuted at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
if [ $1 -ne 0 ]
then 
echo -e "$2..installion $R FAILED $N"
else
echo -e "$2..installation $G SUCESS $N"
fi
}
if [ $ID -ne 0 ]
then
echo -e "$R Error:please run with root user $N"
exit 1
else
echo -e "you are $G root user $N"
fi

#echo "All args passed: $@"

for package in $@
do
  yum list installed $package &>> $LOGFILE
  if [ $? -ne 0 ]
  then 
      yum install $package -y &>> $LOGFILE
      VALIDATE $? "installation of $package"
  else
  echo -e "$package is already installed..$Y SKIP $N"
   fi
done      
