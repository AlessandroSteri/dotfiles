#!/bin/bash

if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
    test -d "${xpath}" && test -x "${xpath}" ; then
    #... is correctly installed
    echo "Xcode Command Line Tools already installed"
else
    #... isn't correctly installed
    echo -n "[Xcode Command Line Tools] Installing..."
    xcode-select --install && echo "installed: ✓"
fi

# Install apple store cli
brew install mas
# install full xcode
mas install 497799835
# Upgrade app installed (in the case xcode already installed but not latest version)
mas upgrade

# Accept Xcode license
sudo xcodebuild -license accept
# Sets  the  active  developer  directory to the given path
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

echo "You may need to manually open Xcode"
