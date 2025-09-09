#!/bin/bash

userid=$(id -u)

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

dnf install mysql -y

validate $? "Installing mysql"

if [ $? -ne 0 ]; then
  echo "Installation of mysql is failure"
  exit 1
fi

dnf install git -y

if [ $? -ne 0 ]; then 
  echo "Installation of git is Failure"
  exit 1
else
  echo "installation of git is success"
fi

echo "is script proceeding?"