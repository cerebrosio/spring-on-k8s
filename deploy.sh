#!/bin/bash

echo `date`
echo "################################"
echo "# Starting deployment process! #"
echo "################################"
echo

echo    "################################"
echo    "Cleanup resources..."
docker  system prune -a -f
echo    "Cleanup resources DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle config-service..."
cd      config-service/
sh      deploy.sh
cd      ..
echo    "Handle config-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle employee-service..."
cd      employee-service/
sh      deploy.sh
cd      ..
echo    "Handle employee-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle department-service..."
cd      department-service/
sh      deploy.sh
cd      ..
echo    "Handle department-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle organization-service..."
cd      organization-service/
sh      deploy.sh
cd      ..
echo    "Handle organization-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle gateway-ingress..."
cd      gateway-ingress/
sh      deploy.sh
cd      ..
echo    "Handle gateway-ingress DONE"
echo    "################################"
echo
echo "################################"
echo "# Deployment process finished! #"
echo "################################"
echo `date`
