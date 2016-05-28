#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git build-essential python-dev exuberant-ctags

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim/


