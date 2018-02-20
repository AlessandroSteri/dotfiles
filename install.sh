#Exit immediately if a command exits with a non-zero status.
set -e 

echo "[Xcode Command Line Tools]"
echo "[Xcode Command Line Tools] installing..."
xcode-select --install
echo "[Xcode Command Line Tools] installed."
echo "[Xcode Command Line Tools] done."

echo "[HOMEBREW]"
echo "[HOMEBREW] installing..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "[HOMEBREW] installed."
echo "[HOMEBREW] done."

echo "[HOMEBREW][Python2]"
echo "[HOMEBREW][Python2] installing..."
brew install python
echo "[HOMEBREW][Python2] installed."
echo "[HOMEBREW][Python2] done."

echo "[HOMEBREW][cmake]"
echo "[HOMEBREW][cmake] installing..."
brew install cmake
echo "[HOMEBREW][cmake] installed."
echo "[HOMEBREW][cmake] done."

echo "[HOMEBREW][Python3]"
echo "[HOMEBREW][Python3] installing..."
brew install python3
echo "[HOMEBREW][Python3] installed."
echo "[HOMEBREW][Python3] done."

echo "[GIT]"
echo "[GIT] installing..."
brew install git
echo "[GIT] installed."
echo "[GIT] done."

echo "[ITERM2]"
echo "[ITERM2] installing..."
brew cask install iterm2
echo "[ITERM2] installed."
echo "[ITERM2] done."

echo "[ITERM2][Oh My Zsh]"
echo "[ITERM2][Oh My Zsh] installing..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "[Oh My Zsh] installed."
echo "[ITERM2][Oh My Zsh] done."

echo "[ITERM2][Oh My Zsh][powerlevel9k]"
echo "[ITERM2][Oh My Zsh][powerlevel9k] installing..."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "[ITERM2][Oh My Zsh][powerlevel9k] done."

echo "[ITERM2][Oh My Zsh][powerlevel9k][nerdfont]"
echo "[ITERM2][Oh My Zsh][powerlevel9k][nerdfont] installing..."
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
echo "[ITERM2][Oh My Zsh][powerlevel9k][nerdfont] done."

echo "[ITERM2][Oh My Zsh][zsh-autosuggestions]"
echo "[ITERM2][Oh My Zsh][zsh-autosuggestions] installing..."
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "[ITERM2][Oh My Zsh][zsh-autosuggestions] done."

echo "[ITERM2][Oh My Zsh][syntax-highlighting]"
echo "[ITERM2][Oh My Zsh][syntax-highlighting] installing..."
brew install zsh-syntax-highlighting
echo "[ITERM2][Oh My Zsh][syntax-highlighting] done."

echo "must backup existing dotfiles"
echo "must do the rcm thing so to have .dotfiles folder for spotifycontrol"

echo "spotify app"
brew cask install spotify

echo "[ITERM2][SpotifyControl]"
echo "[ITERM2][SpotifyControl] installing..."
if [ ! -d $HOME/asDeveloper ]; then
	echo "creating asDeveloper dir cause it doesen't exist"
	mkdir $HOME/asDeveloper
fi
echo "clone spotify control and link it so it works as a command in terminal"
git clone https://github.com/dronir/SpotifyControl.git $HOME/asDeveloper/SpotifyControl
ln -s $HOME/asDeveloper/SpotifyControl /usr/local/bin/spotify
echo "[ITERM2][SpotifyControl] installed..."


echo "[APPSTORE]"
echo "[APPSTORE] installing mac app store cli interface..."
brew install mas
echo "[APPSTORE] installed mac app store cli interface..."

echo "[APPSTORE][Xcode] installing Xcode...(must be installed before installing macvim"
mas install 497799835
echo "[APPSTORE][Xcode] installed Xcode."

echo "maybe you need to manually open xcode before enter the pasword"
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer


#must be after xcode, i know linkapp is deprecated
brew install macvim --override-system-vim
#se non va perche deprecato prova: ln -s /usr/local/bin/mvim vim
brew linkapps macvim


echo "[APPSTORE] installing Notability..."
mas install 736189492
echo "[APPSTORE] installed Notability."

echo "[APPSTORE] installing Bear..."
mas install 1091189122
echo "[APPSTORE] installed Bear."




echo "[APPSTORE] done."


echo "[SYSTEM PREFERENCE]"
echo "[SYSTEM PREFERENCE] changing scroll direction to not natural..." #needs log out for the change to take affect.
defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false
echo "[SYSTEM PREFERENCE] changed scroll direction to not natural." 

echo "[SYSTEM PREFERENCE] setting keyboard speed and repeat to superhero..." #needs log out for the change to take affect.
defaults write NSGlobalDomain KeyRepeat -float 1.3
defaults write NSGlobalDomain InitialKeyRepeat -int 11
echo "[SYSTEM PREFERENCE] set keyboard speed and repeat to superhero."

echo "[Dotfiles]"
echo "[Dotfiles][rcm]"
echo "[Dotfiles][rcm] installing..."
brew tap thoughtbot/formulae
brew install rcm
echo "[Dotfiles][rcm] installed."
echo "[Dotfiles][rcm] done."

#!/bin/sh

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
	echo "install vundle.."
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	echo "installed"
fi
echo "youcompleteme stuff before install plugins"
brew update
brew cask install java

#da capire come lanciare in modo non interattivo
vim -u $HOME/.vimrc.bundles +PluginInstall +qall

~/.vim/bundle/YouCompleteMe/install.py --clang-completer

sleep 1
echo "Installation succesfully completed!"
sleep 1
echo "...for some changes to take effect you need to log out and log back in."
echo "TODOES:"
echo "01 - Edit your ~/.zshrc and set ZSH_THEME=\"powerlevel9k/powerlevel9k\"."
echo "02 - Edit your ~/.zshrc and add BEFORE setting ZSH_THEME variable: POWERLEVEL9K_MODE='nerdfont-complete'"
echo "02 - Edit your ~/.zshrc and add AT THE END: source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
echo '00 _ Edit your ~/.zshrc and add (hide user@hostname): DEFAULT_USER="alessandrosteri" '
echo "00 - add zsh-autosuggestions as plugin in .zshrc: plugins=(zsh-autosuggestions git)"
echo "03 - Change iterm2 Preferences -> Profiles ->  Colors to solarized Dark"
echo "04 - Change iterm2 Preferences -> Profiles ->  Text to 14pt Knack Regular Nerd Font Complete"
echo "04 - Change iterm2 Preferences -> Profiles -> Keys -> Load Preset... -> Natural Text Editing"
echo "Customize prompt of terminal.."
echo "Cerca di capire come installare shell integration per iterm2 e zsh"
echo "0x - Log out and log back in."
echo "add ctags, vim and tmux install"
echo "change keyboard to us"



