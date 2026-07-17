#!/usr/bin/env bash

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create ~/.config if it doesn't exist
mkdir -p ~/.config

TARGET_DIR="$HOME/.config/nvim"

if [ -e "$TARGET_DIR" ]; then
  if [ -L "$TARGET_DIR" ]; then
    echo "Updating existing symlink at $TARGET_DIR"
    rm "$TARGET_DIR"
  else
    BACKUP_DIR="${TARGET_DIR}_backup_$(date +%Y%m%d_%H%M%S)"
    echo "Warning: $TARGET_DIR already exists and is a real directory."
    echo "Backing up to $BACKUP_DIR"
    mv "$TARGET_DIR" "$BACKUP_DIR"
  fi
fi

echo "Linking $SCRIPT_DIR to $TARGET_DIR"
ln -s "$SCRIPT_DIR" "$TARGET_DIR"

echo "Installing plugins..."
# Run lazy sync to install plugins
nvim --headless "+Lazy! sync" +qa

echo "Installing tree-sitter-cli via Mason..."
# Install tree-sitter-cli to ensure treesitter parsers can compile
nvim --headless -c "MasonInstall tree-sitter-cli" -c "qa"

echo "Setup complete! Open Neovim to complete parser installation."
