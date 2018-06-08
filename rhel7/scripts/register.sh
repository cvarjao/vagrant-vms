#!/usr/bin/env bash
set -e
echo "Registering installation ..."
sudo subscription-manager register --auto-attach "--username=${RHN_SUBSCRIPTION_USER}" "--password=${RHN_SUBSCRIPTION_PASSWORD}"
sudo yum install curl rsync -y
