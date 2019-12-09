#!/bin/bash
# Colors
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
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
if [[ "$version" =~ ^(3\.)?([5-8]\.)?([0-9])$ ]]
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
    # Build started message
    {
        echo ""
        echo "░"
        echo -e "░ ${GREEN}✔ Python $version build configured successfully!${NC}"
        echo "░"
        echo -e "░ ${YELLOW}Compiling Python $version build...${NC}"
        echo "░ Wait, please. This process may take some time!"
        echo "░"
    }
    # Make Python build
    sudo make > /dev/null 2>&1
    # Build finished message
    {
        echo -e "░ ${GREEN}✔ Python $version build compiled successfully!${NC}"
        echo "░"
        echo -e "░ ${YELLOW}Installing Python $version...${NC}"
        echo "░ Wait, please. This process may take some time!"
        echo "░"
    }
    # Install
    sudo make install > /dev/null 2>&1
    # CLean up
    sudo apt autoremove
    sudo rm -rf /temp/Python-$version
    sudo rm /temp/Python-$version.tgz
    # Exit message
    {
        echo -e "░ ${GREEN}✔ Python $version installed successfully!${NC}"
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
