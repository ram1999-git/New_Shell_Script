#!/bin/bash

userid=$(id -u)

validate() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2 failed (Exit status: $1)"
        exit 1
    else
        echo "$2 successful"
    fi
}

if [ $userid -ne 0 ]; then
    echo "Please run the script with root access"
    exit 1
else
    echo "You are a superuser"
fi

# Check if MySQL is already installed
if dnf list installed mysql >/dev/null 2>&1; then
    echo "MySQL is already installed"
else
    dnf install mysql -y
    validate $? "Installing MySQL"
fi

# Check if Git is already installed
if dnf list installed git >/dev/null 2>&1; then
    echo "Git is already installed"
else
    dnf install git -y
    validate $? "Installing Git"
fi

echo "Script completed successfully"