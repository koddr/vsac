#!/bin/bash
# Colors
GREEN="\033[0;32m"
WHITE="\033[1;37m"
YELLOW="\033[1;33m"
NC="\033[0m"
# Welcome message
{
    echo ""
    echo "╔═══════════════════════════════════╗"
    echo -e "║   ${GREEN}✔ VDSAC${NC} ${WHITE}for Debian 9 Stretch${NC}    ║"
    echo "╚═══════════════════════════════════╝"
    echo ""
}
# Init Update
sudo apt update && apt upgrade -y
# Install packages
sudo apt ca-certificates -y
# Init bash scripts
sudo chmod u+x ./$1/$2/nginx.sh
sudo chmod u+x ./$1/$2/python3.sh
# Auto or manual continue
if [[ $3 == "auto" ]]
    then
    # Exit message
    {
        echo ""
        echo "░"
        echo -e "░ ${GREEN}✔ Init is complete!${NC}"
        echo "░"
        echo ""
    }
    # Auto continue
    sudo ./$1/$2/nginx.sh
    sudo ./$1/$2/python3.sh $4
    exit
else
    # Exit message
    {
        echo ""
        echo "░"
        echo -e "░ ${GREEN}✔ Init is complete!${NC}"
        echo "░"
        echo "░ Next steps:"
        echo "░"
        echo "░  1. Install Nginx"
        echo "░"
        echo -e "░     ${WHITE}$ ${NC}${GREEN}sudo${NC} ${YELLOW}./$1/$2/nginx.sh${NC}"
        echo "░"
        echo "░  2. Update Python 3"
        echo "░"
        echo -e "░     ${WHITE}$ ${NC}${GREEN}sudo${NC} ${YELLOW}./$1/$2/python3.sh${NC}"
        echo "░"
        echo ""
    }
    exit
fi