#!/bin/bash
# Colors
GREEN="\033[0;32m"
NC="\033[0m"
# Add deb repo
{
    sudo echo ""
    sudo echo "# PostgreSQL"
    sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main"
    sudo echo ""
} >> /etc/apt/sources.list.d/postgresql.list
# Download and add signing key
wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# Remove previous installation
sudo apt remove postgresql -y
# Update
sudo apt update && apt upgrade -y
# Install
sudo apt install postgresql -y
# Enable
sudo systemctl enable postgresql.service
# Start
sudo systemctl start postgresql.service
# Exit message
{
    echo ""
    echo "░"
    echo -e "░ ${GREEN}✔ PostgreSQL installed and configured!${NC}"
    echo "░"
    echo ""
}
