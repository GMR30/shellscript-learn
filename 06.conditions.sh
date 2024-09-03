#!/bin/bash
USERID=$(id -u)
if [ $USERID -eq 0 ]
then
  echo "user has root access"
else
  echo "User has not root privileges"
  exit 127
fi
echo "Installing LVM"
yum install lvm2 -y
if [ $? -eq 0 ]
then
  echo "successfully installed lvm2 application."
else
  echo "We are NOT installed the requested lvm2 application."
  exit 127
fi