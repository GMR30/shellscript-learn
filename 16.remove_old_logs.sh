#!/bin/bash
Date=$(date +"%F-%H-%M-%S")
Path=/home/centos/shellscript-learn
Log_File="$Date.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
Input=$(find /home/centos/shellscript-learn  -name  "*.log" -type f -mtime +0)
echo -e "$G output is$N :${Input}" &>>$Log_File
while IFS= read line;
do

  echo -e "$R Deleting the line:$N $line " &>>$Log_File
  rm -rf  $line
done<<<"$Input"