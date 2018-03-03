#!bin/bash

if [ ! $(command_exists "zsh") ]; then
    echo "[ITERM2][Oh My Zsh] Installing..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel9k]; then
    echo "[ITERM2][Oh My Zsh][powerlevel9k] Installing..."
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

