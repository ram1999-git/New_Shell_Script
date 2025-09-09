#!/bin/bash

userid=$(id -u)
Timestamp=$(date +%F-%H-%M-%S)

Script_Name=$(echo $0 | cut -d "." -f1)
logfile="/tmp/$Script_Name-$Timestamp.log"

validate() {
   if [$1 -ne 0]
    then
      echo "$2 is Failure"
      exit 1
    else
      echo "$2 is success"
    fi
}


# Check for root access
if [ "$userid" -ne 0 ]; then
  echo " Please run the script with root access"
  exit 1
else
  echo "You are a super user"
fi

# Install MySQL
echo "--- Installing MySQL ---"
dnf install mysql -y &>>$logfile
validate $? "Installing mysql"

# Install Git
echo "--- Installing Git ---"
dnf install git -y &>>$logfile
validate $? "Installing git"

