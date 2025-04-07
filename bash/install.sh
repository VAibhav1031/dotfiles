#!/usr/bin/env bash

set -e

echo "Symlinking dotfiles..."

backup_and_link() {
  local src=$1
  local dest=$2

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up $dest to $dest.backup"
    mv "$dest" "$dest.backup"
  fi

  echo "Linking $src to $dest"
  ln -sf "$src" "$dest"
}

backup_and_link ~/dotfiles/bash/.bashrc ~/.bashrc
backup_and_link ~/dotfiles/bash/.bash_profile ~/.bash_profile

# you can add more thing here

echo "All done!"
