#!/usr/bin/env bash

PWD=`pwd`

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf $PWD/tmux.conf ~/.tmux.conf

echo "In tmux, press <prefix>+I to install plugins"
