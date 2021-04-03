#!/bin/bash
echo "Adding oficial Repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo "Creating Namespace Monitoring"
kubectl create ns monitoring
echo "Installing prometheus"
helm install prometheus prometheus-community/prometheus -f values.yaml--namespace monitoring
echo "Exposing Service Prometheus as Nodeport"
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np -n monitoring
