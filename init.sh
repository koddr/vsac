#!/bin/bash
# Colors
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
RED="\033[0;31m"
NC="\033[0m"
# Welcome message
{
    echo ""
    echo "╔═══════════════════════════════════╗"
    echo "║                                   ║"
    echo -e "║     ${GREEN}✔ VDS Auto Config${NC} ${YELLOW}1.2.0${NC}       ║"
    echo -e "║      ${WHITE}github.com/koddr/vdsac${NC}       ║"
    echo "║                                   ║"
    echo "╚═══════════════════════════════════╝"
    echo ""
}
# Choose system
PS3="Choose GNU/Linux distribution [1-2] → "
# Select system
select distribution in Debian Ubuntu
do
    case $distribution in
        Debian)
            # Choose system version
            PS3="Choose $distribution version [1] → "
            # Select version
            select version in Stretch
            do
                case $version in
                    Stretch)
                        # Init VDSAC for Debian Stretch
                        sudo chmod +x ./debian/stretch/init.sh
                        sudo ./debian/stretch/init.sh $@
                        break
                        ;;
                    *)
                        {
                            echo ""
                            echo "░"
                            echo -e "░ ${RED}Unknown $distribution version ($version).${NC}"
                            echo "░"
                            echo ""
                        }
                        exit
                        ;;
                esac
            done
            break
            ;;
        *)
            {
                echo ""
                echo "░"
                echo -e "░ ${RED}Unknown GNU/Linux distribution ($distribution).${NC}"
                echo "░"
                echo ""
            }
            exit
            ;;
    esac
done
