#!/bin/bash
To=$1
Subject=$2
body_content=$(sed -e 's/[]\/$*.^[]/\\&/g'<<<$3)
echo "escaped content: $body_content"
Name=$4
alert_type=$2
template="/home/centos/shellscript-learn/template.html"

final_content=$(sed -e "s/Team/$Name/g" -e "s/body_content/$body_content/g" -e "s/alert_type/$alert_type/g" "$template")

echo "final_content: $final_content"

echo "$final_content" | mail -s "$(echo -e "$Subject\nContent-type: text/html")" "$To"