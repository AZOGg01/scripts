#!/bin/bash
clear

# Récupération de l'IP du serveur
SERVER_IP=$(hostname --all-ip-addresses | cut -d " " -f1)

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

# Création répertoire qui va stocker le fichier yml + cpoie du fichier yml dans ce répertoire
mkdir /guacamole
cp docker-compose.yml /guacamole
cd /guacamole

#Lancement du docker-compose.yml
docker-compose up -d

# Affichage du message de fin avec l'url de guacamole
clear
tput bold; tput setaf 7; echo "LISTE DES CONTAINERS EN COURS : "
tput setaf 3; echo ""
docker container ls
echo ""
tput setaf 7; echo "--------------------------------------------------"
tput bold; tput setaf 7; echo "           => INSTALLATION TERMINEE <=           "
tput setaf 7; echo ""
tput setaf 7; echo "              Lien : http://$SERVER_IP:8080              "
tput setaf 7; echo "    Identifiant : guacadmin | MDP : guacadmin     "
tput setaf 7; echo ""
tput bold; tput setaf 6; echo "                   By AZOGg                      "
tput bold; tput setaf 6; echo "                   azogg.gitlab.com/my_doc       "
tput setaf 7; echo "--------------------------------------------------"
tput setaf 2; echo ""
