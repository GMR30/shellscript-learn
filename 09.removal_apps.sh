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
    echo -e  "$2 ..is $R FAILED $N "
    exit 127
  else
    echo -e  "$2 ..is $G SUCCESS $N "
   fi
          }
yum remove git -y &>>$Log_File
validate $? "GIT is UN-Installation "

yum remove java -y &>>$Log_File
validate $? "JAVA UN-Installation"

yum remove net-tools -y &>>$Log_File
validate $? "NET-TOOLS UN-Installation"

yum remove wget -y &>>$Log_File
validate $? "WGET UN-Installation"
yum remove lvm2 -y &>>$Log_File
validate $? "lvm UN-Installation"
