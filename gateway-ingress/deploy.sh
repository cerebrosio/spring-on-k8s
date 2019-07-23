#!/bin/bash

echo
echo    "Cleanup resources..."
kubectl delete ingress gateway-ingress
echo    "Cleanup resources DONE"
kubectl apply -f ingress.yaml
echo `date`
