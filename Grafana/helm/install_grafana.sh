#!/bin/bash
echo "Adding oficial Repo"
helm search hub grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
echo "Creating Namespace Monitoring"
kubectl create ns monitoring
echo "Installing grafana"
helm install grafana grafana/grafana --namespace monitoring
echo "Exposing Service Grafana as Nodeport"
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np -n monitoring
echo "Senha user admin: "
kubectl get secret -n monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo