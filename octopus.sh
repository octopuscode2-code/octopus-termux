#!/usr/bin/env bash

# ===============================
# Octopus Tool
# Author: Yousef Alzogby
# ===============================

# ---------- Disable GitHub Auth ----------
export GIT_TERMINAL_PROMPT=0
unset GIT_ASKPASS
unset SSH_ASKPASS
rm -f ~/.git-credentials 2>/dev/null
git config --global --unset credential.helper 2>/dev/null

# ---------- Root Check ----------
if [ "$EUID" -eq 0 ]; then
    IS_ROOT=true
else
    IS_ROOT=false
fi

# ---------- Colors ----------
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[1;31m'
PURPLE='\033[1;35m'
NC='\033[0m'

pause() {
  read -p "Press Enter to return..."
}

# ---------- Headers ----------
header_main() {
cat << EOF
  __     __       🇪🇬           __            _                _            
 \ \   / /                  / _|     /\   | |              | |           
  \ \_/ /__  _   _ ___  ___| |_     /  \  | |_______   __ _| |__  _   _  
   \   / _ \| | | / __|/ _ \  _|   / /\ \ | |_  / _ \ / _` | '_ \| | | | 
    | | (_) | |_| \__ \  __/ |    / ____ \| |/ / (_) | (_| | |_) | |_| | 
    |_|\___/ \__,_|___/\___|_|   /_/    \_\_/___\___/ \__, |_.__/ \__, | 
                                                       __/ |       __/ | 
                                                      |___/       |___/  
               Yousef Alzogby
               _____________
EOF
}

header_wifi() {
cat << EOF
 __  🇪🇬   __.______________.___  
/  \    /  \   \_   _____/|   | 
\   \/\/   /   ||    __)  |   | 
 \        /|   ||     \   |   | 
  \__/\  / |___|\___  /   |___| 
       \/           \/          

EOF
}

# ---------- Option 1 ----------
full_update() {
  clear
  echo -e "${YELLOW}=== Full System Update & Setup ===${NC}\n"
  apt update -y && apt upgrade -y
  apt install -y python3 python wget curl nano vim openssh nmap net-tools iproute2 clang make
  echo -e "\n${GREEN}✔ System Ready${NC}"
  pause
}

# ---------- Option 2 ----------
network_scan() {
  clear
  header_wifi
  echo -e "${RED}=== Local Network Scan ===${NC}\n"
  nmap -sn 192.168.1.0/24
  pause
}

# ---------- Option 3 ----------
about_creator() {
  clear
  echo -e "${PURPLE}=== About The Creator ===${NC}\n"
  echo "👨‍💻 Engineer : Yousef Alzogby"
  echo "🎂 Age       : 21"
  echo "📍 Location  : Cairo, Egypt🇪🇬"
  echo "📞 Contact   : +201093740413"
  pause
}

# ---------- Menu ----------
menu() {
  while true; do
    clear
    echo -e "${GREEN}"
    header_main
    echo -e "${NC}"
    echo -e "${YELLOW}1) Full System Update${NC}"
    echo -e "${BLUE}2) Network Scan${NC}"
    echo -e "${PURPLE}3) About${NC}"
    echo -e "${RED}4) Exit${NC}"
    read -p "Select option: " opt

    case "$opt" in
      1) full_update🆙 ;;
      2) network_scan🛜 ;;
      3) about_creator🆔 ;;
      4) exit 0 ;;
      *) echo "Invalid option"; sleep 1 ;;
    esac
  done
}

menu
