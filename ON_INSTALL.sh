#!/bin/sh

#Running this script will set up the installation of the following programs…

#Check if it hast root permission
USER_TO_TEST='0'
if [[ "${USER_TO_TEST}" -ne "${UID}" ]]
then
  echo "Your have to be root to use this program."
  exit 1
fi

#Setting up Go on he path
#Backing up .bashrc
cp ~/.bashrc ~/.bashrc.copy

#Including Go on the path  
echo "#init Go on path" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc

#end of on_start.sh
echo "The on_start.sh is set"

#--->> Installing Go
#check the curent version of Go
GO_VERSION='go1.16'
echo "Where are going to install the version of Go named go1.16, are you ok whit this version? "
read -p 'Yes or No?' OPTION
if [ "$OPTION" = 'n' ]
then
	read -p 'Pls enter the versin og go you what like "go1.16" or "go1.14.2"' GO_VERSION
fi
echo "...we will install $GO_VERSION"

#Download Go
wget -c https://dl.google.com/go/${GO_VERSION}.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
echo "Go has being install"

#--->> Installing node.js
echo "Installing Node.js"
apt install nodejs

echo "you have to reboot the system"