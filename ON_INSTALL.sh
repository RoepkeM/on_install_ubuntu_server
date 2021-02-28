#!/bin/sh

#Running this script will set up the installation of the following programs…

#Check if it hast root permission
USER_TO_TEST='0'
if [[ "${USER_TO_TEST}" -ne "${UID}" ]]
then
  echo "Your have to be root to use this program."
  exit 1
fi

#Setting up on_start.sh
#Backing up .bashrc
cp ~/.bashrc ~/.bashrc.copy

#Including the on_start.sh to ~/.bashrc  
echo "#on start run on_start.sh" >> ~/.bashrc
echo "sh /home/bin/on_start.sh" >> ~/.bashrc

#Creating the on_start.sh file on /home/bin/
mkdir /home/bin
touch /home/bin/on_start.sh
#Filling the information for on_start.sh 
echo "#!/bin/sh" >> /home/bin/on_start.sh
echo "#this script will run on star up" >> /home/bin/on_start.sh
echo "#add Go to the PATH on start" >> /home/bin/on_start.sh
echo "export PATH=$PATH:/usr/local/go/bin" >> /home/bin/on_start.sh

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