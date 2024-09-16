#!/bin/bash
#df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}'
#df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}' | cut -d "%" -f1

cpu_threshold=5
cpu_usage=$(top -bn1 | awk '/Cpu/ { print $2}' )
#v=$cpu_usage
#s=${v/\.*/}
#echo $s
message=""
while IFS= read line;
do
   usage=$(echo $line)
   echo "cpu-usage: $usage"
   v=$usage
   s=${v/\.*/}
   echo $s
  if [ $s -ge $cpu_threshold ]
  then
      message+="High cpu usage on: $s "
  fi
done <<<"$cpu_usage"
echo "message:$message"
echo -e "$message" | mail -s "High cpu usage" raj@subbannadairy.store

