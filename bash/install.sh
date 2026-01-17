#!/usr/bin/env bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${PURPLE}"
echo "███    ██ ███████  ██████ ██████   ██████  ███    ███  █████  ███    ██  ██████ ███████ ██████ "
echo "████   ██ ██      ██      ██   ██ ██    ██ ████  ████ ██   ██ ████   ██ ██      ██      ██   ██"
echo "██ ██  ██ █████   ██      ██████  ██    ██ ██ ████ ██ ███████ ██ ██  ██ ██      █████   ██████ "
echo "██  ██ ██ ██      ██      ██   ██ ██    ██ ██  ██  ██ ██   ██ ██  ██ ██ ██      ██      ██   ██"
echo "██   ████ ███████  ██████ ██   ██  ██████  ██      ██ ██   ██ ██   ████  ██████ ███████ ██   ██"
echo -e "${NC}"
echo -e "${CYAN}=== Dotfiles Installation Script ===${NC}"
echo

echo -e "${BLUE}Symlinking dotfiles...${NC}"

backup_and_link() {
  local src=$1
  local dest=$2
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo -e "${YELLOW}Backing up $dest to $dest.backup${NC}"
    mv "$dest" "$dest.backup"
  fi
  echo -e "${GREEN}Linking $src to $dest${NC}"
  ln -sf "$src" "$dest"
}

backup_and_link ~/dotfiles/bash/.bashrc ~/.bashrc
backup_and_link ~/dotfiles/bash/.bash_profile ~/.bash_profile

# You can add more symlinks here

# Optional: Check for presence of common tools

# /dev/null is a special file in Unix/Linux systems often called the "null device" or "black hole".
# It discards all data written to it and returns EOF (End-of-File) when read from.
# First time using it

check_tools() {
  for tool in "$@"; do
    if ! command -v "$tool" &>/dev/null; then
      echo -e "${YELLOW}$tool is not installed. Some features may not work properly.${NC}"
    fi
  done
}

# Check for optional tools that enhance your setup
check_tools figlet lolcat cowsay fortune

echo -e "${GREEN}All done! Your dotfiles have been set up.${NC}"


