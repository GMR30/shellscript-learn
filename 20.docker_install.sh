#!/bin/bash
userid=$(id -u)
Date=$(date +"%F-%H-%M-%S")
Log_File="$Date.docker-log-file.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

#To know the which line got error
set -eE -o functrace

failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

#To check user is root or not
if [ $userid -ne 0 ]
then
   echo "You are not root user,please run the script with root user"
   exit 127
fi
 echo -e "$G Installing yum utils package $N"
 yum install -y yum-utils &>>$Log_File
 echo -e "$G  yum utils package Installed Successfully $N"

 echo -e "$R Downloading the docker to the repos list $N"
 yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo  &>>$Log_File
 echo -e "$G  docker to the repos list updated  Successfully $N"

 echo -e "$R Installing docker  package $N"
 yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin  &>>$Log_File
 echo -e "$G  docker  package installed Successfully $N"

 echo -e "$R start and enabling  a docker Service $N"
 systemctl start docker     &>>$Log_File
 systemctl enable docker    &>>$Log_File
 echo -e "$G  start and enabling  a docker service is done successfully $N"