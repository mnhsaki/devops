#!/usr/bin/env bash

if [ `id -u` != 0 ]; then
  echo "Error: install_certbot must be executed by root"
  exit -1
fi

echo
echo
echo "Add EPEL repository"
yum -y install epel-release
echo
echo "Check Certbot already instald ?"
#Certbot_installation
if [ ! -x /usr/bin/certbot ]; then
echo
echo
        echo "INSTALLING Certbot"
echo
echo
        yum -y install certbot  -y
echo
echo
        echo "SUCESSFULLY INSTALLED Certbot"
else
echo
echo
        echo "ALREADY INSTALLED Certbot"
        certbot -v
echo
echo
fi

echo
echo
echo "Now that you have access to the repository, install all of the required packages:"

sudo yum install certbot python2-certbot-nginx mod_ssl

echo
echo
echo "Certbot packages install done"
echo
echo
cd
clear
echo "###############"
echo "###"
echo
echo "# Certbot Install Finished. "
echo
echo "###"
echo "###############"
#Certbot_installation
#certbot certonly --standalone -d example.com -d www.example.com
#certbot certonly --expand -d example.com,www.example.com