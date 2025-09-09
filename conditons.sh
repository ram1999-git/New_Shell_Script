#!/bin/bash

Userid = $(id -u)
 if[$Userid -ne 0]
  then
     echo "You are a super user"
  else
     echo "please run as a super user"
     exit 1
  fi

dnf install mysql -y
  if ($? -ne 0)
   then 
     echo "Installation of mysql failed"
     exit 1
   else 
     echo "Mysql Installation sucess"

dnf insal git -y
  if ($? -ne 0)
   then 
     echo "Installation of git failed"
     exit 1
   else 
     echo "git Installation sucess"

