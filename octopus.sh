#!/usr/bin/env bash

# ===============================
# Octopus Tool
# Author: Yousef Alzogby
# ===============================

# ---------- Git Safety ----------
export GIT_TERMINAL_PROMPT=0
unset GIT_ASKPASS SSH_ASKPASS
rm -f ~/.git-credentials 2>/dev/null
git config --global --unset credential.helper 2>/dev/null

# ---------- Detect Environment ----------
IS_ROOT=false
IS_TERMUX=false

[ "$EUID" -eq 0 ] && IS_ROOT=true
[ -d "$PREFIX" ] && IS_TERMUX=true

if $IS_ROOT; then
    MODE="ROOT MODE"
else
    MODE="USER MODE"
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

# ---------- Header ----------
header_main() {
cat << 'EOF'
  __     __       🇪🇬           __            _                _
 \ \   / /                  / _|     /\   | |              | |
  \ \_/ /__  _   _ ___  ___| |_     /  \  | |_______   __ _| |__  _   _
   \   / _ \| | | / __|/ _ \  _|   / /\ \ | |_  / _ \ / _` | '_ \| | | |
    | | (_) | |_| \__ \  __/ |    / ____ \| |/ / (_) | (_| | |_) | |_| |
    |_|\___/ \__,_|___/\___|_|   /_/    \_\_/___\___/ \__, |_.__/ \__, |
                                                       __/ |       __/ |
                                                      |___/       |___/
               Yousef Alzogby
EOF
echo -e "               ${MODE}"
}

# ---------- Update System ----------
full_update() {
  clear
  echo -e "${YELLOW}=== System Update & Upgrade ===${NC}\n"

  if $IS_TERMUX; then
      pkg update -y && pkg upgrade -y
      echo -e "${GREEN}✔ Termux Updated${NC}"

  elif $IS_ROOT; then
      apt update -y && apt upgrade -y
      echo -e "${GREEN}✔ System Updated (Root)${NC}"

  else
      echo -e "${BLUE}[i] Non-root mode detected${NC}"
      echo "    Packages cannot be upgraded without root."
      echo "    You can run this tool using: sudo ./octopus.sh"
  fi

  pause
}

# ---------- Network Scan ----------
network_scan() {
  clear
  echo -e "${BLUE}=== Local Network Scan ===${NC}\n"

  if command -v nmap >/dev/null 2>&1; then
      nmap -sn 192.168.1.0/24 2>/dev/null
  else
      echo -e "${RED}[!] nmap not installed${NC}"
  fi

  pause
}

# ---------- About ----------
about_creator() {
  clear
  echo -e "${PURPLE}=== About ===${NC}\n"
  echo "👨‍💻 Engineer : Yousef Alzogby"
  echo "📍 Cairo, Egypt 🇪🇬"
  echo "🔐 Cyber & Linux Enthusiast"
  pause
}

# ---------- Menu ----------
menu() {
  while true; do
    clear
    echo -e "${GREEN}"
    header_main
    echo -e "${NC}"

    echo -e "${YELLOW}1) System Update & Upgrade 🔄${NC}"
    echo -e "${BLUE}2) Network Scan 📡${NC}"
    echo -e "${PURPLE}3) About 🆔${NC}"
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
