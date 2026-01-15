#!/usr/bin/env bash

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[1;31m'
PURPLE='\033[1;35m'
NC='\033[0m'

pause() {
  read -p "Press Enter to return..."
}

header_main() {
cat << EOF
 __   __                      _     _       _          _
 \\ \\ / /__  _   _ ___  ___   / \\   | |_ ___| |__   ___| |_
  \\ V / _ \\| | | / __|/ _ \\ / _ \\  | __/ __| '_ \\ / _ \\ __|
   | | (_) | |_| \\__ \\  __// ___ \\ | || (__| | | |  __/ |_
   |_|\\___/ \\__,_|___/\\___/_/   \\_\\ \\__\\___|_| |_|\\___|\\__|

               Yousef Alzogby
               _____________
EOF
}

header_wifi() {
cat << EOF
 __        ___ _     _
 \\ \\      / (_) |__ | |__
  \\ \\ /\\ / /| | '_ \\| '_ \\
   \\ V  V / | | | | | | | |
    \\_/\\_/  |_|_| |_|_| |_|
EOF
}

full_update() {
  clear
  echo -e "${YELLOW}=== Full Termux Update & Setup ===${NC}\n"
  pkg update -y && pkg upgrade -y
  pkg install -y python python3 git wget curl nano vim openssh nmap net-tools iproute2 clang make
  echo -e "\n${GREEN}✔ Done${NC}"
  pause
}

network_scan() {
  clear
  header_wifi
  echo -e "${RED}=== Network Scan ===${NC}\n"
  nmap -sn 192.168.1.0/24
  pause
}

about_creator() {
  clear
  echo -e "${PURPLE}=== About ===${NC}\n"
  echo "👨‍💻 Engineer Yousef Alzogby"
  echo "🎂 Age: 21"
  echo "📍 Cairo, Egypt"
  echo "📞 +201093740413"
  pause
}

menu() {
  while true; do
    clear
    echo -e "${GREEN}"
    header_main
    echo -e "${NC}"
    echo -e "${YELLOW}1) Full Update${NC}"
    echo -e "${BLUE}2) Network Scan${NC}"
    echo -e "${PURPLE}3) About${NC}"
    echo -e "${RED}4) Exit${NC}"
    read -p "Select option: " opt

    case "$opt" in
      1) full_update ;;
      2) network_scan ;;
      3) about_creator ;;
      4) exit 0 ;;
      *) echo "Invalid option"; sleep 1 ;;
    esac
  done
}

menu
