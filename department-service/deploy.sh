#!/bin/bash

echo
echo    "Cleanup resources..."
kubectl delete service,deployment department-service
echo    "Cleanup resources DONE"
mvn     clean install
docker  build -t cerebrosio/department-service:1.0 .
docker  push cerebrosio/department-service:1.0
kubectl apply -f deployment.yaml
echo `date`
