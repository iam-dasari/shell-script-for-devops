#!/bin/bash

DATE=$(date +%F)
SOURCE_DIR=/tmp/delete-files
LOG_FILE=$SOURCE_DIR/$DATE_deleted_files.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ ! -d $SOURCE_DIR ]
then
echo -e "$R ERROR:: $SOURCE_DIR is not a directory $N"
exit
fi

#find $SOURCE_DIR -mmin -20 -type f -exec rm {} +;

FILES_TO_DELETE=$(find $SOURCE_DIR -mmin -20 -type f  -name "*.log")

#IFS= prevents leading/trailing whitespace trimming
while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line &>>$LOG_FILE
done <<< $FILES_TO_DELETE