#!/bin/bash

echo
echo    "################################################################"
echo    "Deploy of config-service version $1 ..."
echo    "Cleanup k8s resources..."
kubectl delete service,deployment config-service
echo    "Cleanup k8s resources DONE!"
mvn     clean install -Dprj.version=$1
docker  build --build-arg APP_VER=$1 -t cerebrosio/config-service:$1 .
docker  push cerebrosio/config-service:$1
sed     -i "s/{APP_VER}/$1/g" deployment.yaml
echo    "Install k8s resources:"
cat     deployment.yaml
kubectl apply -f deployment.yaml
sed     -i "s/$1/{APP_VER}/g" deployment.yaml
echo    "Handle config-service DONE"
echo    "################################################################"
echo    `date`
