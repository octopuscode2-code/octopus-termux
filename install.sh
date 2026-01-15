#!/data/data/com.termux/files/usr/bin/bash

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

clear
echo -e "${GREEN}🐙 Octopus Tool Installer${NC}"
echo "================================="

# Check Termux environment
if [ -z "$PREFIX" ]; then
  echo -e "${RED}❌ This installer must be run inside Termux${NC}"
  exit 1
fi

# Update Termux
echo -e "${YELLOW}🔄 Updating Termux...${NC}"
pkg update -y && pkg upgrade -y

# Install dependencies
echo -e "${YELLOW}📦 Installing required packages...${NC}"
pkg install -y python python3 git wget curl nmap net-tools

# Create install folder
INSTALL_DIR="$HOME/octopus-tool"
BIN_DIR="$PREFIX/bin"

if [ -d "$INSTALL_DIR" ]; then
  echo -e "${YELLOW}⚠ Existing installation found. Updating...${NC}"
else
  mkdir -p "$INSTALL_DIR"
fi

# Copy main script placeholder
echo -e "${GREEN}✏ Creating placeholder octopus.sh${NC}"
cat << EOF > "$INSTALL_DIR/octopus.sh"
#!/data/data/com.termux/files/usr/bin/bash
echo "🐙 Octopus Tool Placeholder — add your octopus.sh code here"
EOF

chmod +x "$INSTALL_DIR/octopus.sh"

# Create global command
if [ ! -f "$BIN_DIR/octopus" ]; then
  echo -e "${GREEN}🔗 Creating command: octopus${NC}"
  cat << EOF > "$BIN_DIR/octopus"
#!/data/data/com.termux/files/usr/bin/bash
bash "$INSTALL_DIR/octopus.sh"
EOF
  chmod +x "$BIN_DIR/octopus"
else
  echo -e "${YELLOW}ℹ Command 'octopus' already exists${NC}"
fi

echo
echo -e "${GREEN}✅ Octopus Tool installed successfully!${NC}"
echo -e "Run it anytime by typing: ${YELLOW}octopus${NC}"
echo "================================="
