#!/bin/bash

echo `date`
echo "################################################################"
echo "##                Starting deployment process!                ##"
echo "################################################################"
echo

echo    "################################################################"
echo    "Remove docker images..."
docker  system prune -a -f
echo    "Remove docker images DONE!"
echo    "################################################################"
echo
cd      config-service/
sh      deploy.sh $1
cd      ..
echo
cd      employee-service/
sh      deploy.sh $1
cd      ..
echo
cd      department-service/
sh      deploy.sh $1
cd      ..
echo
cd      organization-service/
sh      deploy.sh $1
cd      ..
echo
cd      gateway-ingress/
sh      deploy.sh
cd      ..
echo
echo "################################################################"
echo "##                Deployment process finished!                ##"
echo "################################################################"
echo `date`
