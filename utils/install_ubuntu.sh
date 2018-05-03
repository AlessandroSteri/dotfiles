#!/bin/bash

echo "UPDATE APT-GET"
sudo apt-get -qq update

sudo apt install wget
sudo apt-get install curl #if not vimplug is not autoinstallable hence vim do not work

echo "INSTALLING GIT"
sudo apt-get install git

echo "INSTALLING PYTHON3"
sudo apt install python3
sudo apt-get install python3-setuptools
sudo apt-get install python3-pip

#install scheduler
echo "INSTALLING TASK-SPOOLER"
sudo apt-get install task-spooler

echo "INSTALLING VIM"
sudo apt-get install vim

echo "INSTALLING TMUX"
sudo apt-get install tmux

echo "INSTALLING ZSH"
sudo apt-get install zsh
sudo apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/local/share/zsh-syntax-highlighting

git clone https://github.com/AlessandroSteri/dotfiles.git ~/.dotfiles

# Powerlevel9k
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# usa agnoster

sudo easy_install3 ipdb

ln -fFs ~/.dotfiles/zshrc ~/.zshrc
ln -fFs ~/.dotfiles/vimrc ~/.vimrc
ln -fFs ~/.dotfiles/vimrc.bundles ~/.vimrc.bundles
ln -fFs ~/.dotfiles/aliases ~/.aliases
ln -fFs ~/.dotfiles/utils/zshrc.ubuntu ~/.zshrc.local
ln -fFs ~/.dotfiles/tmux.conf ~/.tmux.conf # make sure to run prefix + I to install plugins
# comment this line from tmux.conf: set-option -g default-command "reattach-to-user-namespace -l zsh"
ln -fFs ~/.dotfiles/gitconfig ~/.gitconfig
ln -fFs ~/.dotfiles/gitignore ~/.gitingore
ln -fFs ~/.dotfiles/gitmessage ~/.gitmessage


# SAUCECODE PRO NERD FONT

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# get ready to compile YCM
sudo apt-get install python-dev python3-dev #do not put before vim, may compile vim with python2
sudo apt-get install build-essential cmake
sudo apt-get install build-essential cmake3

vim +PluginInstall +qall && echo "installed: ✓"

#restart post zsh install
sudo shutdown -r 0
# Not Used
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#if compile ycm fails:
#cd ~/.vim/bundle/YouCompleteMe
#./install.py --clang-completer

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
