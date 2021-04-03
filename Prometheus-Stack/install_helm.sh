#!/bin/bash

echo "Downloading Helm Package"
wget https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz
echo "Unziping Package"
tar -xvf helm-v3.2.4-linux-amd64.tar.gz
echo "Moving to /usr/bin/"
sudo mv linux-amd64/helm /usr/bin/
sudo chmod +x /usr/bin/helm
echo "Getting Helm Version"
helm version
echo "Adding oficial Repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo "Helm installed"