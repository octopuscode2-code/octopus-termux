#!/usr/bin/env bash

# ===============================
# 🐙 Octopus Tool
# 👨‍💻 Author: Yousef Alzogby
# ===============================

# ---------- Detect Mode ----------
IS_ROOT=false
[ "$EUID" -eq 0 ] && IS_ROOT=true

MODE="👤 USER MODE"
$IS_ROOT && MODE="👑 ROOT MODE"

# ---------- Colors ----------
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
NC='\033[0m'

pause() {
  read -p "⏎ Press Enter to return..."
}

# ---------- Main Banner ----------
header_main() {
clear
echo -e "${GREEN}"
cat << 'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣄⡀⠀⠀⠀⣀⠠⠤⣤⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣧⡄⠙⢲⡿⡃⠊⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣷⡿⣿⣿⢔⠋⠈⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡏⢁⣰⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠗⣿⣿⣻⣿⠿⢓⣡⣴⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢢⣼⣧⣄⠞⠊⣥⣶⣾⣟⡿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠒⠚⠉⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
echo -e "${NC}"
echo -e "        🐙 ${GREEN}Octopus Tool${NC} — ${YELLOW}${MODE}${NC}"
}

# ---------- Update & Upgrade ----------
full_update() {
  clear
  echo -e "${YELLOW}🔄 === System Update & Upgrade ===${NC}\n"

  PACKAGES=(
    git
    curl
    wget
    nmap
    openssh
    net-tools
    iproute2
    nano
    vim
    figlet
    python3
  )

  if command -v apt >/dev/null 2>&1; then
      if $IS_ROOT; then
          echo -e "${GREEN}👑 ROOT MODE detected${NC}"
          apt update -y
          apt upgrade -y
          apt install -y "${PACKAGES[@]}"
      else
          echo -e "${BLUE}👤 USER MODE detected${NC}"
          echo -e "${CYAN}⚡ Installing packages without ROOT...${NC}"
          apt update
          apt upgrade -y
          apt install -y "${PACKAGES[@]}"
      fi

      echo -e "\n${GREEN}✅ All required packages installed successfully${NC}"
  else
      echo -e "${RED}❌ Package manager (apt) not found${NC}"
  fi

  pause
}
    

# ---------- Network Banner ----------
header_network() {
echo -e "${RED}"
cat << 'EOF'
 /$$      /$$ /$$  /$$$$$$  /$$      
| $$  /$ | $$|__/ /$$__  $$|__/      
| $$ /$$$| $$ /$$| $$  \__/ /$$      
| $$/$$ $$ $$| $$| $$$$    | $$      
| $$$$_  $$$$| $$| $$_/    | $$      
| $$$/ \  $$$| $$| $$      | $$      
| $$/   \  $$| $$| $$      | $$      
|__/     \__/|__/|__/      |__/      
EOF
echo -e "${NC}"
}

network_scan() {
  clear
  header_network
  echo -e "${RED}📡 === Local Network Scan ===${NC}\n"

  if command -v nmap >/dev/null 2>&1; then
    nmap -sn 192.168.1.0/24
  else
    echo -e "${RED}❌ nmap not installed${NC}"
  fi

  pause
}

# ---------- About ----------
about_creator() {
  clear
  echo -e "${CYAN}"
cat << 'EOF'
⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀ ⣀⣀⣤⣤⣤⣀⡀
⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀
⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆
⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆
⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹
⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦
⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟
⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
EOF
echo -e "${NC}"

echo -e "${GREEN}👨‍💻 Engineer:${NC} Yousef Alzogby"
echo -e "${BLUE}📍 Location:${NC} Cairo, Egypt 🇪🇬"
echo -e "${YELLOW}📞 Phone:${NC} +201093740413"
echo -e "${PURPLE}🛡️ Title:${NC} Octopus Master 🐙"

pause
}

# ---------- Menu ----------
menu() {
  while true; do
    header_main
    echo
    echo -e "${YELLOW}1) 🔄 System Update${NC}"
    echo -e "${RED}2) 📡 Network Scan${NC}"
    echo -e "${CYAN}3) 🆔 About${NC}"
    echo -e "${RED}4) ❌ Exit${NC}"
    echo
    read -p "👉 Select option: " opt

    case "$opt" in
      1) full_update ;;
      2) network_scan ;;
      3) about_creator ;;
      4) exit 0 ;;
      *) echo -e "${RED}❗ Invalid option${NC}"; sleep 1 ;;
    esac
  done
}

menu
