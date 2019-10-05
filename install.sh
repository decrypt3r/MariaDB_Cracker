#!/bin/bash

#####Color Codes#####
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
#####################

#####Installation Animation#####
clear
echo
echo
echo -e ${RED} "Installation Started..."

cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | tr -d \" | awk '{print $1;}' > os.txt
os=`cat os.txt`




#############################################################################################################################################
#####Figlet & Python For Redhat & CentOS#####
if [ "$os" == "Red" ] || [ "$os" == "CentOS" ]
then
        find /bin/ -name "figlet" > figlet.txt
        fig=`cat figlet.txt`
        if [[ $fig == *"/bin/figlet"* ]]; then
                echo -e ${GREEN} "Figlet is already Installed"
        else
                yum install wget -y
                wget http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/f/figlet-2.2.5-9.el7.x86_64.rpm
                rpm -i figlet-2.2.5-9.el7.x86_64.rpm
        fi




        find /bin/ -name "python3.6" > python.txt
        pytho=`cat python.txt`
        if [[ $pytho == *"/bin/python3.6"* ]]; then
                echo -e ${GREEN} "Python is already Installed"
        else
                yum install python36 -y
        fi




        pip3.6 list all --format=legacy | grep mysql-connector | awk '{print $1;}' > mconnect.txt
        mconnect=`cat mconnect.txt`
        if [[ $mconnect == *"mysql-connector"* ]]; then
                echo -e ${GREEN} "mysql-connector is already Installed"
        else
                pip3.6 install mysql-connector
        fi



##############################################


#####Other Linux#####
else
        find /bin/ -name "figlet" > figlet.txt
        fig=`cat figlet.txt`
        if [[ $fig == *"/bin/figlet"* ]]; then
                echo "Figlet is already Installed"
        else
                apt-get install figlet -y
        fi

        find /bin/ -name "python3.6" > python.txt
        pytho=`cat python.txt`
        if [[ $pytho == *"/bin/python3.6"* ]]; then
                echo -e ${GREEN} "Python is already Installed"
        else
                apt-get install python36 -y
        fi


        pip3.6 list all --format=legacy | grep mysql-connector | awk '{print $1;}' > mconnect.txt
        mconnect=`cat mconnect.txt`
        if [[ $mconnect == *"mysql-connector"* ]]; then
                echo -e ${GREEN} "mysql-connector is already Installed"
        else
                pip3.6 install mysql-connector
        fi
######################
fi
#############################################################################################################################################




#####Move to bin and give permission#####
cp marcrack /usr/bin/
mkdir -p /usr/bin/marcrackk
cp crack.py /usr/bin/marcrackk/
chmod a+x /usr/bin/marcrack
chmod a+x /usr/bin/marcrackk/crack.py
#########################################
