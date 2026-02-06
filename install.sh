#!/data/data/com.termux/files/usr/bin/bash

# ===============================
# 🐙 Octopus Tool Installer
# 👨‍💻 Author: Yousef Alzogby
# ===============================

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

clear
echo -e "${GREEN}🐙 Octopus Tool Installer${NC}"
echo "================================="

# Check Termux
if [ -z "$PREFIX" ]; then
  echo -e "${RED}❌ This installer is for Termux only${NC}"
  exit 1
fi

# Update Termux
echo -e "${YELLOW}🔄 Updating Termux...${NC}"
pkg update -y && pkg upgrade -y

# Install dependencies
echo -e "${YELLOW}📦 Installing required packages...${NC}"
pkg install -y git wget curl nmap python figlet net-tools

# Paths
INSTALL_DIR="$HOME/octopus-termux"
BIN_DIR="$PREFIX/bin"

# Check main script
if [ ! -f "$INSTALL_DIR/octopus.sh" ]; then
  echo -e "${RED}❌ octopus.sh not found in $INSTALL_DIR${NC}"
  exit 1
fi

# Permissions
chmod +x "$INSTALL_DIR/octopus.sh"

# Create command
echo -e "${GREEN}🔗 Creating command: octopus${NC}"
rm -f "$BIN_DIR/octopus"
cat << EOF > "$BIN_DIR/octopus"
#!/data/data/com.termux/files/usr/bin/bash
bash "$INSTALL_DIR/octopus.sh"
EOF

chmod +x "$BIN_DIR/octopus"

echo
echo -e "${GREEN}✅ Octopus Tool installed successfully!${NC}"
echo -e "👉 Run it anytime by typing: ${YELLOW}octopus${NC}"
echo "================================="
