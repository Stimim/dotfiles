#!/usr/bin/env bash

set -x # echo on
PWD=`pwd`

mkdir -p ~/.vim/bundle

ln -sf $PWD ~/.vim/stimim
ln -sf ~/.vim/stimim/vimrc.vim ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -u ~/.vim/stimim/bundles.vim +PlugInstall +qall

cd ~/.vim/bundle/YouCompleteMe && ./install.py # --clang-completer

mkdir -p ~/.vim/after/syntax/cpp

ln -sf ~/.vim/bundle/STL-Syntax/syntax/stl.vim ~/.vim/after/syntax/cpp/
