userid =$(is -u)
if[$userid -ne 0]
then 
 echo "Please print the above statement as root access"
else
 echo "you are the Root user"
fi

for i in $@
do
 echo "Insatall all packags :$i"
 dnf list installed $i
  if[$? -ne 0]
 then 
  echo -e "$i already installed "\e[31m"skip"\e[30m""
 else
  echo "$i not installed please "\e[32m"install"\e[30m""
 fi
done