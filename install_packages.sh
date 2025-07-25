#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/tmp
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR::  Please run this script with root access $N"
    exit 1 #Other than 0 and values from 1 to 127
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}
cp file1.txt file2.txt &>> $LOGFILE

VALIDATE $? "Copying the contents of file1.txt to file2.txt"


