#!/bin/bash

echo
echo    "################################"
echo    "Handle config-service..."
echo    "Cleanup resources..."
kubectl delete service,deployment config-service
echo    "Cleanup resources DONE"
mvn     clean install
docker  build -t cerebrosio/config-service:1.0 .
docker  push cerebrosio/config-service:1.0
kubectl apply -f deployment.yaml
echo    "Handle config-service DONE"
echo    "################################"
echo `date`
