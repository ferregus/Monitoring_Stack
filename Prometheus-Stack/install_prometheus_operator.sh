#!/bin/bash
echo "Adding oficial Repo"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
echo "Creating Namespace Monitoring"
kubectl create ns monitoring
echo "Installing prometheus"
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
echo "Checking instalation"
kubectl --namespace monitoring get pods -l "release=prometheus"
echo "Port-Fowarding Prometheus"
kubectl port-forward -n monitoring prometheus-prometheus-prometheus-oper-prometheus-0 9090