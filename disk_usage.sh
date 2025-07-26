#!/bin/bash

LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

message=""
DISK_USAGE_THRESHOLD=20

DISK_USAGE=$(df -hT | grep -vE 'tmfs|Filesystem')

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $(NF-1)}' | cut -d % -f1)
    if [ $usage -gt $DISK_USAGE_THRESHOLD ]
    then
        #echo -e "$R ERROR:: disk usage is more $N"
        message+="HIGH DISK USAGE $usage"
    fi
done <<< $DISK_USAGE

#echo -e "message: $message"

sh mail.sh dasaridevops2025@gmail.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk usage"

