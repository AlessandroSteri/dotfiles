#!bin/bash

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

PACKAGES=(
    cmake
    ctags
    git
    mercurial
    npm
    python
    python3
    reattach-to-user-namespace
    smlnj
    the_silver_searcher
    tmate
    tmux
    vim
    wget
    zsh-syntax-highlighting
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    alfred
    firefox
    google-chrome
    google-drive
    iterm2
    # already in dotfiles
    # macvim
    mactex
    task-spooler
    telegram
    skim
    skype
    slack
    spectacle
    spotify
    vlc
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-hack-nerd-font
    font-awesome-terminal-fonts
)
brew cask install ${FONTS[@]}

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    csvkit
    numpy
    scipy
    scikit-learn
    tqdm
    matplotlib
    pylint
    sklearn
    yapf
#     ipython
#     virtualenv
#     virtualenvwrapper
)
sudo pip install ${PYTHON_PACKAGES[@]}

echo "Installing Python3 packages..."
PYTHON3_PACKAGES=(
    telegram-send
)
sudo pip3 install ${PYTHON3_PACKAGES[@]}

EASYINSTALL=(
    ipdb
    pudb
)
sudo easy_install ${EASYINSTALL[@]}
# echo "Installing Ruby gems"
# RUBY_GEMS=(
#     bundler
#     filewatcher
#     cocoapods
# )
# sudo gem install ${RUBY_GEMS[@]}
