#!/bin/bash

echo
echo    "Cleanup resources..."
kubectl delete service,deployment employee-service
echo    "Cleanup resources DONE"
mvn     clean install
docker  build -t cerebrosio/employee-service:1.0 .
docker  push cerebrosio/employee-service:1.0
kubectl apply -f deployment.yaml
echo `date`
