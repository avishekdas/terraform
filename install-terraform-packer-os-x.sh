#!/usr/bin/env bash
# Script prerequisite > install jq > https://stedolan.github.io

cd ~

# Prerequisites
if [ "$(uname)" == "Darwin" ]; then
    brew install jq
# For Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get install --assume-yes jq
fi

# Get URLs for most recent versions
# For OS-X
if [ "$(uname)" == "Darwin" ]; then
    terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "darwin.*64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
    packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "darwin.*64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
# For Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
    packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
fi

# Create a move into directory.
cd
mkdir packer
mkdir terraform && cd $_

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading $terraform_url."
curl -o terraform.zip $terraform_url
# Unzip and install
unzip terraform.zip

# Change directory to Packer
cd ~/packer

# Download Packer. URI: https://www.packer.io/downloads.html
echo "Downloading $packer_url."
curl -o packer.zip $packer_url
# Unzip and install
unzip packer.zip

if [ "$(uname)" == "Darwin" ]; then
  echo '
  # Terraform & Packer Paths.
  export PATH=~/terraform/:~/packer/:$PATH
  ' >>~/.bash_profile

  source ~/.bash_profile
# For Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo '
  # Terraform & Packer Paths.
  export PATH=~/terraform/:~/packer/:$PATH
  ' >>~/.bashrc

  source ~/.bashrc
fi