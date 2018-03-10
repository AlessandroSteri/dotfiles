#!/bin/bash

echo "UPDATE APT-GET"
apt-get -qq update

echo "INSTALLING GIT"
apt-get -qq --yes --force-yes git

echo "INSTALLING VIM"
apt-get -qq --yes --force-yes vim

echo "INSTALLING TMUX"
apt-get -qq --yes --force-yes tmux

echo "INSTALLING ZSH"
apt-get install zsh
apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

#restart post zsh install
sudo shutdown -r 0
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

