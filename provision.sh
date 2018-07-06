#!/bin/bash

echo "########################"
echo "# Initial package update and upgrade"
echo "########################"
sudo apt-get -y update
sudo apt-get -y upgrade

echo "########################"
echo "# Install python-pip"
echo "########################"
sudo apt-get -y install python-pip

echo "########################"
echo "# PIP Install robotframework"
echo "########################"
pip install robotframework