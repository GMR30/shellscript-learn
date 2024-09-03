#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
   echo "You are not root user,please run the script with root user"
   exit 127
fi
echo "installing Git"

yum install git -y

if [ $? -ne 0 ]
then
  echo "Git had failed to install"
  exit 127
else
  echo "Git is Successfully installed"
fi

echo "installing java "

yum install java -y

if [ $? -ne 0 ]
then
  echo "java had failed to install"
  exit 127
else
  echo "java is Successfully installed"
fi

echo "installing net-tools"

yum install net-tools -y

if [ $? -ne 0 ]
then
  echo "net-tools had failed to install"
  exit 127
else
  echo "net-tools is Successfully installed"
fi

echo "installing wget"

yum install wget -y

if [ $? -ne 0 ]
then
  echo "wget had failed to install"
  exit 127
else
  echo "wget is Successfully installed"
fi
