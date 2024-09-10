#!/bin/bash
userId=$(id -u)
Date=$(date +"%F-%H-%M-%S")
log_file="$Date.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

## TO CHECK THE USER HAS ROOT PERMISSIONS ARE NOT

if [ $userId -ne 0 ]
  then
    echo -e " $R As we verified you are not the root user,please login as root user to run the script $N"
    exit 127
fi
validate()
{
  if [ $1 -ne 0 ]
  then echo -e "$2 ...is $R APP INSTALLATION FAILED $N"
  exit 127
  else
  echo -e "$2 .. is $G APP UN-INSTALLATION IS SUCCESS $N"
  fi

}
for application_name in $@
do
  yum -q list installed $application_name &>/dev/null
  if[ $? -eq 0 ]
  then
    echo -e " $application_name $R  application is already installed $N"
    yum remove $application_name -y &>>log_file
    validate $? "$application_name UN-INSTALLATION"
    else
      echo -e "$application_name $Y is UN-INSTALLED already $N"

  fi
done

