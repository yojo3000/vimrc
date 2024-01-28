#!/bin/bash

brew update -y
brew upgrade -y
brew install vim git ctags -y

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/vimrc
cp vimrc ~/.vimrc
vim +PluginInstall +qall
echo "colorscheme gruvbox" >> ~/.vimrc
rm -rf ~/vimrc
