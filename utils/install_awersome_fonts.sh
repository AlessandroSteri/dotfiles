#!/bin/bash

#Exit immediately if a command exits with a non-zero status.
set -e

mkdir -p ~/asDeveloper/awesome_fonts_install
cd ~/asDeveloper/awesome_fonts_install

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mv PowerlineSymbols.otf ~/Library/Fonts

fc-cache -vf ~/Library/Fonts

mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
