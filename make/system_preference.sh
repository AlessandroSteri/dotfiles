#!bin/bash

    echo -n "[SYSTEM PREFERENCE] changing scroll direction to not natural..." #needs log out for the change to take affect.
    defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false && echo "changed: ✓"

    echo -n "[SYSTEM PREFERENCE] setting keyboard speed and repeat to superhero..." #needs log out for the change to take affect.
    defaults write NSGlobalDomain KeyRepeat -float 1.3 && defaults write NSGlobalDomain InitialKeyRepeat -int 11 && echo "changed: ✓"

