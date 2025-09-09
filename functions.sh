#!/bin/bash

userid=$(id -u)
Timestamp=$(date +%F-%H-%M-%S)
Script_Name=$($0 | awk -d "." -f1)
logfile =/temp/$Script_Name-$Timestamp.logss

validate(){
    if [$1 -ne 0]
    then
      echo "$2 is Failure"
      exit 1
    else
      echo "$2 is success"
    fi
}

if [ $userid -ne 0 ]; then
  echo "Please run the script with root access"
  exit 1
else
  echo "You are super user"
fi

dnf install mysql -y &>>$logfile

validate $? "Installing mysql"

if [ $? -ne 0 ]; then
  echo "Installation of mysql is failure"
  exit 1
fi

dnf install git -y &>>$logfile

if [ $? -ne 0 ]; then 
  echo "Installation of git is Failure"
  exit 1
else
  echo "installation of git is success"
fi

echo "is script proceeding?"