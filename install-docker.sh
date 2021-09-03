#!/bin/bash

#Téléchargement des packages
sudo apt-get update

#CONFIGURER LE RÉFÉRENTIEL
#Mettez à jour l' apt index du package et installez les packages pour permettre l' apt utilisation d'un référentiel via HTTPS:
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common python3-pip

#Ajoutez la clé GPG officielle de Docker:
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

#Ajout du référentiel (pour debian)
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

#Téléchargement des packages
sudo apt-get update

#installation de  Docker Engine, containerd, et docker compose
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose 
