#!/bin/bash
#df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}'
#df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}' | cut -d "%" -f1

Disk_threshold=20
Disk_usage=$(df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6 " " $1}' )
message=""
while IFS= read line;
do
  usage=$(echo $line | cut -d "%" -f1)
  partition=$(echo $line | cut -d " " -f2)
   echo "usage: $usage"
   echo "partition: $partition"
  #echo -e "Disk_usage:$Disk_usage"
  if [ $usage -ge $Disk_threshold ]
  then
      message+="High disk usage on $partition:$usage % \n "
  fi
done <<<"$Disk_usage"
echo "message:$message"
echo -e "$message" | mail -s "High Disk usage" raj@subbannadairy.com
#echo -e "$message" | mail -s "High Disk usage" devarapalli.mrudulareddy@gmail.com