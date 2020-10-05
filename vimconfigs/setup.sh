#!/usr/bin/env bash

set -x # echo on
PWD=`pwd`

mkdir -p ~/.vim/bundle

ln -sf $PWD ~/.vim/stimim
ln -sf ~/.vim/stimim/vimrc.vim ~/.vimrc

# git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -u ~/.vim/stimim/bundles.vim +PlugInstall +qall
