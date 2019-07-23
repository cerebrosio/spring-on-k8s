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
echo    "Handle employee-service..."
sh      /employee-service/deploy.sh
echo    "Handle employee-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle department-service..."
sh      /department-service/deploy.sh
echo    "Handle department-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle organization-service..."
sh      /organization-service/deploy.sh
echo    "Handle organization-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle organization-service..."
sh      /config-service/deploy.sh
echo    "Handle organization-service DONE"
echo    "################################"
echo
echo    "################################"
echo    "Handle gateway-ingress..."
sh      /gateway-ingress/deploy.sh
echo    "Handle gateway-ingress DONE"
echo    "################################"
echo
echo "################################"
echo "# Deployment process finished! #"
echo "################################"
echo `date`
