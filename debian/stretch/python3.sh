#!/bin/bash
# Colors
GREEN="\033[0;32m"
WHITE="\033[1;37m"
NC="\033[0m"
# Waiting for user input
if [[ $1 ]]
    then
    version=$1
else
    echo -e "Enter ${WHITE}Python 3${NC} version to install (ex. 3.7.0): "
    read version
fi
# Home dir
cd ~
# Install dependencies
sudo apt install build-essential libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev zlib1g -y
# Download
sudo wget https://www.python.org/ftp/python/$version/Python-$version.tgz
# Unzip
sudo tar -xzvf Python-$version.tgz
# Configure
sudo Python-$version/configure --enable-optimizations
sudo make
# Install
sudo make install
# Show version
python3 --version
# CLean up
sudo apt autoremove
sudo rm -rf ~/Python-$version
sudo rm ~/Python-$version.tgz
# Exit message
{
    echo ""
    echo "░"
    echo -e "░ ${GREEN}✔ Python $version installed!${NC}"
    echo "░"
    echo ""
}