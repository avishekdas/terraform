#!/usr/bin/env bash
# Script prerequisite > install jq > https://stedolan.github.io

cd ~
sudo yum -y update
wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod +x ./jq
cp jq /usr/bin
sudo yum install git


