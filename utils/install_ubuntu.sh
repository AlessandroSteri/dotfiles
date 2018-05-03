#!/bin/bash

echo "UPDATE APT-GET"
sudo apt-get -qq update

sudo apt install wget

echo "INSTALLING GIT"
sudo apt-get install git

echo "INSTALLING PYTHON3"
sudo apt install python3
sudo apt-get install python3-setuptools
sudo apt-get install python3-pip

echo "INSTALLING VIM"
sudo apt-get install vim

echo "INSTALLING TMUX"
sudo apt-get install tmux

echo "INSTALLING ZSH"
sudo apt-get install zsh
sudo apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

git clone https://github.com/AlessandroSteri/dotfiles.git ~/.dotfiles

# Powerlevel9k
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# usa agnoster

sudo easy_install3 ipdb

ln -fFs ~/.dotfiles/zshrc ~/.zshrc
ln -fFs ~/.dotfiles/vimrc ~/.vimrc
ln -fFs ~/.dotfiles/vimrc.bundles ~/.vimrc.bundles
ln -fFs ~/.dotfiles/aliases ~/.aliases

# SAUCECODE PRO NERD FONT
# DISABLE CTAG BREW IN ALIAS

#restart post zsh install
sudo shutdown -r 0
# Not Used
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# MAY BE USEFULL
case "$OSTYPE" in
  linux*)   echo "LINUX" ;;
  darwin*)  echo "OSX" ;;
  win*)     echo "Windows" ;;
  cygwin*)  echo "Cygwin" ;;
  bsd*)     echo "BSD" ;;
  solaris*) echo "SOLARIS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
