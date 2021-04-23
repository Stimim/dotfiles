#!/bin/bash



sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -e "~/.zshrc" ]; then
  ln -s "$(pwd)/zshrc" ~/.zshrc
fi
