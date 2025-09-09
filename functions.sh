#!/bin/bash

USERID=$(id -u)

validate(){
   echo "Exit status : $1"
}

if [ $USERID -ne 0 ];
 then
    echo "Please run as a superuser (use sudo)"
    exit 1
else
    echo "You are a superuser"
fi

# Install MySQL
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Installation of MySQL failed"
    exit 1
else
    echo "MySQL installation successful"
fi
VALIDATE $? "INSTALLED MYSQL"