#!/bin/bash

echo
echo    "Cleanup resources..."
kubectl delete service,deployment organization-service
echo    "Cleanup resources DONE"
mvn     clean install
docker  build -t cerebrosio/organization-service:1.0 .
docker  push cerebrosio/organization-service:1.0
kubectl apply -f deployment.yaml
echo `date`

