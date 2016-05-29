#!/bin/bash

sudo yum update -y
sudo yum upgrade -y
sudo yum install git ctags python-devel -y

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/yojo3000/vimrc.git ~/vimrc
cd ~/vimrc
cp vimrc ~/.vimrc
vim +PluginInstall +qall
echo "colorscheme gruvbox" >> ~/.vimrc
rm -rf ~/vimrc
