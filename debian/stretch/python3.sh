#!/bin/bash
# Colors
GREEN="\033[0;32m"
WHITE="\033[1;37m"
RED="\033[0;31m"
NC="\033[0m"
# Waiting for user input
if ! [[ -z "$1" ]]
then
    version=$1
else
    read -p "Enter Python 3 version to install [ex. 3.7.0] → " version
fi
# Check Python version
if [[ "$version" =~ ^(3\.)?([5-7]\.)?([0-9])$ ]]
then
    # Install dependencies
    sudo apt install build-essential libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev zlib1g -y
    # Download
    sudo wget -P /temp https://www.python.org/ftp/python/$version/Python-$version.tgz
    # Go to temp
    cd /temp
    # Unzip
    sudo tar -xzvf Python-$version.tgz
    # Configure
    sudo Python-$version/configure --enable-optimizations
    # Make Python build
    sudo make
    # Build finished message
    {
        echo ""
        echo "░"
        echo -e "░ ${GREEN}✔ Python build finished successfully!${NC}"
        echo "░"
        echo "░ Starting install Python $version..."
        echo "░ Wait, please. This process may take some time!"
        echo "░"
        echo ""
    }
    # Install
    sudo make install > /dev/null 2>&1
    # Show version
    python3 --version
    # CLean up
    sudo apt autoremove
    sudo rm -rf /temp/Python-$version
    sudo rm /temp/Python-$version.tgz
    # Exit message
    {
        echo ""
        echo "░"
        echo -e "░ ${GREEN}✔ Python $version installed!${NC}"
        echo "░"
        echo ""
    }
else
    # Error message
    {
        echo ""
        echo "░"
        echo -e "░ ${RED}Choose another Python version (ex. 3.7.0).${NC}"
        echo "░"
        echo ""
    }
    exit
fi
