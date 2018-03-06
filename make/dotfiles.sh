#!bin/bash

if [ ! $(command_exists "rcup") ]; then
    echo -n "[Dotfiles][rcm] Installing..."
    brew tap thoughtbot/formulae >/dev/null
    brew install rcm
fi
if [ -d $HOME/.dotfiles ]; then
    # Exist folder
    REPO="https://github.com/AlessandroSteri/dotfiles.git"
    CWD="$(pwd)"
    cd $HOME/.dotfiles
    ACTUAL_REPO=$(git config --get remote.origin.url)
    if [ "$REPO" != "$ACTUAL_REPO" ]; then
        echo "Already exist .dotfiles and is not the right one: backup old .dotfiles dir"
        mv $HOME/.dotfiles $HOME/dotfiles_old/dotfiles
        echo "[Dotfiles][MyGitHub] cloning..."
        git clone https://github.com/AlessandroSteri/dotfiles.git $HOME/.dotfiles && echo "cloned: ✓"
    else
        echo "already cloned right repo"
    fi
    cd $CWD
else
    # Not exist folder
    echo "[Dotfiles][MyGitHub] cloning..."
    git clone https://github.com/AlessandroSteri/dotfiles.git $HOME/.dotfiles && echo "cloned: ✓"
fi


echo "Backup existing dotfiles still have to handle dotfiles nested in folders]"
# Actually ok, already cloned repo
ARGS='-x install.sh -x README.md -x header.png -x test -x ping_and_ip -x utils -x make'
CMD_LSRC=()
CMD_LSRC=('lsrc' $ARGS)

for DOT_FILE in $(${CMD_LSRC[@]}); do
    # echo .$(basename $DOT_FILE)
    DOT_FILE_NAME=.$(basename $DOT_FILE)
    # echo $DOT_FILE_NAME
    # if exist
    if [ -f $HOME/$DOT_FILE_NAME ]; then
        echo "$DOT_FILE_NAME exists, moving into $HOME/dotfiles_old."
        mv $HOME/$DOT_FILE_NAME $HOME/dotfiles_old
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

# requires directory
git clone https://github.com/dronir/SpotifyControl.git $HOME/asDeveloper/SpotifyControl
ln -s $HOME/asDeveloper/SpotifyControl /usr/local/bin/spotify


# requires directory
git clone https://github.com/altercation/vim-colors-solarized.git $HOME/asDeveloper/vim-colors-solarized
cp $HOME/asDeveloper/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors/

#############
# VIM
#############
# needs xcode
echo "[macvim] Installing..."
brew install macvim --with-override-system-vim && echo "installed: ✓"
#se non va perche deprecato prova: ln -s /usr/local/bin/mvim vim
brew linkapps macvim && echo "macvim linked: ✓"

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PluginInstall +qall && echo "installed: ✓"

