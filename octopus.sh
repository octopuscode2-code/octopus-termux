#!/usr/bin/env bash

# ===============================
# Octopus Tool
# Author: Yousef Alzogby
# ===============================

# ---------- Detect Mode ----------
IS_ROOT=false
[ "$EUID" -eq 0 ] && IS_ROOT=true

MODE="USER MODE"
$IS_ROOT && MODE="ROOT MODE"

# ---------- Colors ----------
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m'

pause() {
  read -p "Press Enter to return..."
}

# ---------- Main Banner (GREEN) ----------
header_main() {
  echo -e "${GREEN}"
cat << 'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣄⡀⠀⠀⠀⣀⠠⠤⣤⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣧⡄⠙⢲⡿⡃⠊⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣷⡿⣿⣿⢔⠋⠈⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡏⢁⣰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠗⣿⣿⣻⣿⠿⢓⣡⣴⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢢⣼⣧⣄⠞⠊⣥⣶⣾⣟⡿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠒⠚⠉⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
  echo -e "${NC}"
  echo -e "            ${GREEN}Octopus Tool — ${MODE}${NC}"
}

# ---------- Option 1: Update (YELLOW) ----------
full_update() {
  clear
  echo -e "${YELLOW}=== System Update & Upgrade ===${NC}\n"
  if $IS_ROOT; then
    apt update -y && apt upgrade -y
  else
    echo -e "${RED}[!] Update & Upgrade require ROOT${NC}"
  fi
  pause
}

# ---------- Network Banner (RED) ----------
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
  if command -v nmap >/dev/null 2>&1; then
    nmap -sn 192.168.1.0/24
  else
    echo -e "${RED}[!] nmap not installed${NC}"
  fi
  pause
}

# ---------- About (CYAN / BLUE-GREEN MIX) ----------
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
  echo -e "${GREEN}Engineer:${NC} Yousef Alzogby"
  echo -e "${BLUE}Location:${NC} Cairo, Egypt 🇪🇬"
  pause
}

# ---------- Menu ----------
menu() {
  while true; do
    clear
    header_main
    echo
    echo -e "${YELLOW}1) System Update 🔄${NC}"
    echo -e "${RED}2) Network Scan 📡${NC}"
    echo -e "${CYAN}3) About 🆔${NC}"
    echo -e "${RED}4) Exit ❌${NC}"
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
