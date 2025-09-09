#!/bin/bash

userid=$(id -u)
Timestamp=$(date +%F-%H-%M-%S)
Script_Name=$(echo $0 | cut -d "." -f1)
logfile =/tmp/$Script_Name-$Timestamp.logss
R="\e[31m"
G="\e[32m"
N="\e[0m"

vali1date(){
    if [$1 -ne 0]
    then
      echo -e "$2...$R Failure $N"
      exit 1
    else
      echo -e "$2...$G success $N"
    fi
}

if [ $userid -ne 0 ]; then
  echo "Please run the script with root access"
  exit 1
else
  echo "You are super user"
fi

dnf install mysql -y 

validate $? "Installing mysql"


dnf install git -y 

validate $? "Installing git"


echo "is script proceeding?"