#!/bin/bash
# Colors
GREEN="\033[0;32m"
WHITE="\033[1;37m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
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
# Auto or manual continue
while [[ -n "$1" ]]
do
    case "$1" in
        --webserver)
            # Check option value
            if ! [[ -z "$2" ]]
            then
                # Nginx
                if [[ "$2" =~ ^nginx$ ]]
                then
                    # Init bash scripts
                    sudo chmod +x ./debian/stretch/nginx.sh
                    # Install
                    sudo ./debian/stretch/nginx.sh
                fi
            else
                # Error
                {
                    echo ""
                    echo "░"
                    echo -e "░ ${RED}Value for option $1 is required.${NC}"
                    echo "░"
                    echo ""
                }
                exit
            fi
            shift
            ;;
        --python)
            # Check option value
            if ! [[ -z "$2" ]]
            then
                # Init bash scripts
                sudo chmod +x ./debian/stretch/python3.sh
                # Update Python 3
                sudo ./debian/stretch/python3.sh $2
            else
                # Error
                {
                    echo ""
                    echo "░"
                    echo -e "░ ${RED}Value for option $1 is required.${NC}"
                    echo "░"
                    echo ""
                }
                exit
            fi
            shift
            ;;
        --postgresql)
            # Check option value
            if ! [[ -z "$2" ]]
            then
                # Init bash scripts
                sudo chmod +x ./debian/stretch/postgresql.sh
                # Install PostgreSQL
                sudo ./debian/stretch/postgresql.sh $2
            else
                # Error
                {
                    echo ""
                    echo "░"
                    echo -e "░ ${RED}Value for option $1 is required.${NC}"
                    echo "░"
                    echo ""
                }
                exit
            fi
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            # Manual continue
            {
                echo ""
                echo "░"
                echo -e "░ ${GREEN}✔ Init is complete!${NC}"
                echo "░"
                echo "░ Next steps:"
                echo "░"
                echo "░   Install Nginx"
                echo "░"
                echo -e "░     ${WHITE}$ ${NC}${GREEN}sudo${NC} ${YELLOW}./debian/stretch/nginx.sh${NC}"
                echo "░"
                echo "░   Update Python 3"
                echo "░"
                echo -e "░     ${WHITE}$ ${NC}${GREEN}sudo${NC} ${YELLOW}./debian/stretch/python3.sh [VERSION]${NC}"
                echo "░"
                echo "░   Install PostgreSQL"
                echo "░"
                echo -e "░     ${WHITE}$ ${NC}${GREEN}sudo${NC} ${YELLOW}./debian/stretch/postgresql.sh [DATABASE]${NC}"
                echo "░"
                echo ""
            }
            exit
            ;;
    esac
    shift
done
