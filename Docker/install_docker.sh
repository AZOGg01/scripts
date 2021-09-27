#!/bin/bash
clear

# Détection de l'OS
source /etc/os-release
OS=$ID

if [ $OS == "debian" ] || [ $OS == "kali" ] || [ $OS == "ubuntu" ]; then
	echo "OS supporté"
else
	echo "OS non supporté"
fi

if [ $OS == "kali" ]; then
	    OS="debian"
fi

# Installation des dépendances et de docker
apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/$OS/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$OS $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce docker-compose
systemctl enable docker
systemctl start docker
