#!/bin/bash

echo `date`
echo "################################################################"
echo "##                Running dashboard...........                ##"
echo "################################################################"
echo
kubectl proxy --address='0.0.0.0' --accept-hosts='.*'