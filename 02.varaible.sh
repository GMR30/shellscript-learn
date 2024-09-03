#!/bin/bash
Name=Rajabhushanam.yeguru
echo "My name is $Name"
echo "My name is ${Name}"

DATE=$(date +%F)
echo "Hello today'S date is $DATE"

#passing variable
Name=$1
Welcome=$2
How=$3
echo "Hello $1,$2,$3"

echo "Hello ${Name},${Welcome},${How}"

#to know no of arguments passed and what are they ?
echo "The no of arguments is : $#"
echo "The arguments are: $@ "