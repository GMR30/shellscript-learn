#!/bin/bash
userid=$(id -u)
Date=$(date +"%F-%H-%M-%S")
Log_File="$Date.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
if [ $userid -ne 0 ]
then
   echo "You are not root user,please run the script with root user"
   exit 127
fi
validate(){
   if [ $1 -ne 0 ]
  then
    echo -e "$2 ..is $R FAILED $N  "
    exit 127
  else
    echo -e  "$2 ..is $G SUCCESS $N "
   fi
          }
yum install git -y &>>$Log_File
validate $? "GIT installation"

yum install java -y &>>$Log_File
validate $? "JAVA installation"

yum install net-tools -y &>>$Log_File
validate $? "NET-TOOLS installation"

yum install wget -y &>>$Log_File
validate $? "WGET installation"
