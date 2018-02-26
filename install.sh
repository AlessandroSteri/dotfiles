#!/bin/bash

# Debug
# set -x
# trap read debug

#Exit immediately if a command exits with a non-zero status.
# set -e
main() {
    LOG="install_log"

    # Creating asDeveloper dir if not exist.
    if [ ! -d $HOME/asDeveloper ]; then
        #echo "creating asDeveloper dir cause it doesen't exist"
        mkdir -p $HOME/asDeveloper
    fi

    # Creating log dir if not exist.
    # if [ ! -d $HOME/asDeveloper/$LOG ]; then
        #echo "creating asDeveloper dir cause it doesen't exist"
        # mkdir -p $HOME/asDeveloper/$LOG
    # fi

    # check how to check if is ok like other stuff
    echo -n "[Xcode Command Line Tools] Installing..."
    xcode-select --install && echo "installed: ✓"

    # not working cause brew ask for a key to be pressed to start installing
    # > $HOME/asDeveloper/$LOG/brew.log.txt

    if test ! $(which brew)
    then
      echo -n " [HOMEBREW] Installing..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && echo "installed: ✓"
    fi

    if [ ! $(command_exists "python2") ]; then
        echo -n "[HOMEBREW][Python2] Installing..."
        brew install python >/dev/null && echo "installed: ✓"
    fi

    if [ ! $(command_exists "cmake") ]; then
        echo -n "[HOMEBREW][cmake] Installing..."
        brew install cmake >/dev/null && echo "installed: ✓"
    fi

    if [ ! $(command_exists "python3") ]; then
        echo -n "[HOMEBREW][Python3] Installing..."
        brew install python3 >/dev/null && echo "installed: ✓"
    fi


    if [ ! $(command_exists "git") ]; then
        echo -n "[GIT] Installing..."
        brew install git >/dev/null && echo "installed: ✓"
    fi


    if [ ! $(command_exists "wget") ]; then
        echo -n "[WGET] Installing..."
        brew install wget >/dev/null && echo "installed: ✓"
    fi


    if [ ! $(command_exists "tmux") ]; then
        echo -n "[TMUX] Installing..."
        brew install tmux >/dev/null && echo "installed: ✓"
    fi


    echo -n "[CTAGS] Installing..."
    brew install ctags >/dev/null && echo "installed: ✓"


    if [ ! $(command_exists "reattach-to-user-namespace") ]; then
        echo -n "[TMUX][reattach-to-user-namespace] Installing..."
        brew install reattach-to-user-namespace >/dev/null && echo "installed: ✓"
    fi


    if [ ! $(command_exists "tmate") ]; then
        echo -n "[TMUX][TMATE] Installing..."
        brew install tmate >/dev/null && echo "installed: ✓"
    fi



    echo -n "[ITERM2] Installing..."
    brew cask install iterm2 >/dev/null && echo "installed: ✓"

    if [ ! $(command_exists "zsh") ]; then
        echo -n "[ITERM2][Oh My Zsh] Installing..."
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null && echo "installed: ✓"
    fi


    echo -n "[ITERM2][Oh My Zsh][powerlevel9k] Installing..."
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k >/dev/null && echo "installed: ✓"

    echo -n "[ITERM2][Oh My Zsh][powerlevel9k][nerdfont] Installing..."
    brew tap caskroom/fonts >/dev/null
    brew cask install font-hack-nerd-font >/dev/null && echo "installed: ✓"

    # echo -n "[ITERM2][Oh My Zsh][zsh-autosuggestions] Installing..."
    # git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions && echo "installed: ✓ [Not active in default zshrc]"

    echo -n "[ITERM2][Oh My Zsh][syntax-highlighting] Installing..."
    brew install zsh-syntax-highlighting >/dev/null && echo "installed: ✓"


    echo "must do the rcm thing so to have .dotfiles folder for spotifycontrol"

############################################################
#                      DOTFILES                            #
############################################################

    if [ ! $(command_exists "rcup") ]; then
        echo -n "[Dotfiles][rcm] Installing..."
        brew tap thoughtbot/formulae >/dev/null
        brew install rcm >/dev/null && echo "installed: ✓"
    fi


    # TODO: to test
    if [ -d $HOME/.dotfiles ]; then
        mkdir -p dotfiles_old-$(date +%Y)-$(date +%D) >/dev/null
        mv $HOME/.dotfiles $HOME/dotfiles_old-$(date +%Y)-$(date +%D) >/dev/null
    fi

    echo -n "[Dotfiles][MyGitHub] cloning..."
    git clone https://github.com/AlessandroSteri/dotfiles.git $HOME/.dotfiles >/dev/null && echo "cloned: ✓"

    echo "Backup existing dotfiles, stil have to handle dotfiles nested in folders"

    ARGS='-x install.sh -x README.md -x header.png -x test -x ping_and_ip -x utils'
    CMD_LSRC=()
    CMD_LSRC=('lsrc' $ARGS)

    if [ ! -d $HOME/dotfiles_old ]; then
        #echo "creating dotfiles_old dir cause it doesen't exist"
        mkdir -p $HOME/dotfiles_old >/dev/null
    fi

    for DOT_FILE in $(${CMD_LSRC[@]}); do
        # echo .$(basename $DOT_FILE)
        DOT_FILE_NAME=.$(basename $DOT_FILE)
        # echo $DOT_FILE_NAME
        # if exist
        if [ -f $HOME/$DOT_FILE_NAME ]; then
            echo "$DOT_FILE_NAME exists, moving into $HOME/dotfiles_old."
            mv $HOME/$DOT_FILE_NAME $HOME/dotfiles_old >/dev/null
        else
            echo "New dotfile $DOT_FILE_NAME will be installed."
        fi
    done

    echo -n "[Dotfiles][.Dotfiles] Installing..."
    CMD_RCUP=()
    CMD_RCUP=('rcup' $ARGS)
    # rcup -x install.sh -x README.md -x header.png -x test -x ping_and_ip -x utils && echo "installed: ✓"
    "${CMD_RCUP[@]}" >/dev/null && echo "installed: ✓"

    echo "===========================[Installed Dotfiles]==========================="
    "${CMD_LSRC[@]}"
    echo "=========================================================================="



############################################################
#                         LATEX                            #
############################################################
    echo -n "[Latex][Skim]"
    brew cask install skim >/dev/null && echo "installed: ✓"
    # [PROBABLY WORK, JUST OPEN A NEW SHELL] not vorking with vimtex, cant find latexmk and bibtex
    echo -n "[Latex][mactex]"
    brew cask install mactex >/dev/null && echo "installed: ✓"
    # to uninstal (so i can retry to make it work)
    # brew cask remove mactex


    # if in the need of a fast yet ugly all-inclusive latex editing env
    # brew cask install texmaker >/dev/null

    echo -n "[Spotify]"
    brew cask install spotify >/dev/null && echo "installed: ✓"

    echo -n "[Spotify][SpotifyControl] Installing..."

    #echo "clone spotify control and link it so it works as a command in terminal"
    git clone https://github.com/dronir/SpotifyControl.git $HOME/asDeveloper/SpotifyControl >/dev/null
    ln -s $HOME/asDeveloper/SpotifyControl /usr/local/bin/spotify >/dev/null && echo "installed: ✓"

    if [ ! -d $HOME/.vim/colors ]; then
        #echo "creating .vim/colors dir cause it doesen't exist"
        mkdir -p $HOME/.vim/colors
    fi

    echo -n "[Vim][Solarized] Installing..."
    git clone https://github.com/altercation/vim-colors-solarized.git $HOME/asDeveloper/vim-colors-solarized >/dev/null
    cp $HOME/asDeveloper/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/ && echo "installed: ✓"


    echo -n "[APPSTORE cli-interface] Installing..."
    brew install mas >/dev/null && echo "installed: ✓"

    echo "[APPSTORE][Xcode] Installing...(must be installed before installing macvim"
    mas install 497799835 >/dev/null && echo "[APPSTORE][Xcode] installed: ✓"

    echo "[maybe not needed] maybe you need to manually open xcode before enter the pasword"
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer >/dev/null && echo "xcode-select: ✓"
    echo "should be enough not to need to open"
    sudo xcodebuild -license accept >/dev/null
    #must be after xcode, i know linkapp is deprecated
    echo -n "[macvim] Installing..."
    brew install macvim --with-override-system-vim >/dev/null && echo "installed: ✓"
    #se non va perche deprecato prova: ln -s /usr/local/bin/mvim vim
    brew linkapps macvim >/dev/null && echo "macvim linked: ✓"


    echo -n "[APPSTORE][Notability] installing ..."
    mas install 736189492 >/dev/null && echo "installed: ✓"

    echo -n "[APPSTORE][Bear] Installing..."
    mas install 1091189122 >/dev/null && echo "installed: ✓"

    echo "[APPSTORE] done."

    echo -n "[Telegram] Installing..."
    brew cask install telegram >/dev/null && echo "installed: ✓"
    echo -n "[Alfred] Installing..."
    brew cask install >/dev/null alfred

    echo -n "[SYSTEM PREFERENCE] changing scroll direction to not natural..." #needs log out for the change to take affect.
    defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false && echo "changed: ✓"

    echo -n "[SYSTEM PREFERENCE] setting keyboard speed and repeat to superhero..." #needs log out for the change to take affect.
    defaults write NSGlobalDomain KeyRepeat -float 1.3 && defaults write NSGlobalDomain InitialKeyRepeat -int 11 && echo "changed: ✓"

    if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
        echo -n "[Vundle] Installing..."
        git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim >/dev/null && echo "installed: ✓"
    fi

    # brew update
    # brew cask install java

    #da capire come lanciare in modo non interattivo e se funziona echo installed
    echo -n "[Vundle][PluginInstall] Installing..."
    vim -u $HOME/.vimrc.bundles +PluginInstall +qall && echo "installed: ✓"
    ~/.vim/bundle/YouCompleteMe/install.py --clang-completer >/dev/null

    # SSH
    # Enabling SSH [syst - pref sharing - remote login]
    sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
    # Disabling SSH
    # sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist

    # Install mosh to have a more reliable ssh
    # brew install mosh

    echo "Installation succesfully completed!"
    echo "TODOES:"
    sleep 1
    echo "01 - Change iterm2 Preferences -> Profiles ->  Colors to solarized Dark"
    echo "02 - Change iterm2 Preferences -> Profiles ->  Text to 14pt Knack Regular Nerd Font Complete"
    echo "03 - Change iterm2 Preferences -> Profiles -> Keys -> Load Preset... -> Natural Text Editing"
    echo "...for some changes to take effect you need to log out and log back in."
    echo "Cerca di capire come installare shell integration per iterm2 e zsh"
    echo "change keyboard to us"
    echo "for tmate to work you must generate a ssh-key if not existing"
    echo "inistial script: send via telegram tmate session or just let it on"
}

#############################################
# FUNCTION DEFINITION                       #
#############################################

success () {
  printf "\r\033[2K  [ \033[00;32mOK ✓\033[0m ] $1\n"
  echo ''
}

fail () {
  printf "\r\033[2K  [\033[0;31m FAIL \033[0m] $1\n"
  echo ''
  # exit
}


ask_confirmation(){
    while true; do
        read -p "Do you wish to install [$1]?" yn
        case $yn in
            [Yy]* ) make install; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}
# ask_conf "HKJ EKJ EJK"

# non working with: iterm, powerlevel9k, nerd fonts, zsh/syntax-highliting, mactex, skim, spotify
# for rcm do rcup or lsrc
command_exists(){
    if [ $(command -v $1) ]; then echo true; fi
}

main "$@"
