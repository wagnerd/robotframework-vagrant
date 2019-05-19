#!/bin/bash

echo "########################"
echo "# Install net-tools"
echo "########################"
sudo apt-get -y install net-tools

echo "########################"
echo "# Uninstall old versions"
echo "########################"
sudo apt-get -y remove docker docker-engine docker.io containerd runc

echo "########################"
echo "# set up Docker’s repositories"
echo "########################"
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "########################"
echo "# INSTALL DOCKER CE"
echo "########################"
sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io