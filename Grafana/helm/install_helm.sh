#!/bin/bash

#Digita os comandos no terminal, se existir retorna true
HAS_WGET="$(type "wget" &> /dev/null && echo true || echo false)"
HAS_HELM="$(type "helm" &> /dev/null && echo true || echo false)"
DIRECTORY="/usr/bin/helm"

if [  "${HAS_WGET}" != "true" ]; then
    echo "Installing WGET"
	apt-get install wget
fi


if [[ -d /usr/bin/helm ]]
then
    echo "helm exists on your filesystem."
	exit 0
fi
  if [ "${HAS_HELM}" == "true"]; then
    echo "Helm  installed" 
	exit 1
    elif [ "${HAS_HELM}" == "false" ]; then
	  echo "Downloading Helm Package 3.2.4"
	  wget https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz
      echo "Unziping Package"
      tar -xvf helm-v3.2.4-linux-amd64.tar.gz
	  echo "Moving to /usr/bin/"
	  sudo mv linux-amd64/helm /usr/bin/
      sudo chmod +x /usr/bin/helm
   fi


echo "Adding oficial Repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo "Helm installed"