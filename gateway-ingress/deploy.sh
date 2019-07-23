#!/bin/bash

echo
echo    "################################################################"
echo    "Handle gateway-ingress..."
echo    "Cleanup k8s resources..."
kubectl delete ingress gateway-ingress
echo    "Cleanup k8s resources DONE!"
kubectl apply -f ingress.yaml
echo    "Handle gateway-ingress DONE!"
echo    "################################################################"
echo `date`
