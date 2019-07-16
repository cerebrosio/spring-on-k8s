#!/bin/bash

echo `date`
echo "################################"
echo "# Starting deployment process! #"
echo "################################"
echo

echo    "################################"
echo    "Cleanup resources..."
kubectl delete service,deployment employee-service
kubectl delete service,deployment organization-service
kubectl delete service,deployment department-service
kubectl delete ingress gateway-ingress
docker  system prune -a -f
echo    "Cleanup resources DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle employee-service..."
cd      employee-service/
mvn     clean install
docker  build -t cerebrosio/employee-service:1.0 .
docker  push cerebrosio/employee-service:1.0
kubectl apply -f deployment.yaml
echo    "Handle employee-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle department-service..."
cd      ..
cd      department-service/
mvn     clean install
docker  build -t cerebrosio/department-service:1.0 .
docker  push cerebrosio/department-service:1.0
kubectl apply -f deployment.yaml
echo    "Handle department-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle organization-service..."
cd      ..
cd      organization-service/
mvn     clean install
docker  build -t cerebrosio/organization-service:1.0 .
docker  push cerebrosio/organization-service:1.0
kubectl apply -f deployment.yaml
echo    "Handle organization-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle gateway-ingress..."
cd      ..
cd      gateway-ingress/
kubectl apply -f ingress.yaml
echo    "Handle gateway-ingress DONE"
echo    "################################"
echo
echo "################################"
echo "# Deployment process finished! #"
echo "################################"
echo `date`
