#!bin/bash

command_exists () {
    type "$1" &> /dev/null ;
}

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# TODO command_exists is not available here, so include definition (find where it is)
if [ ! $(command_exists "git") ]; then
    echo "Installing git"
    brew install git
fi
