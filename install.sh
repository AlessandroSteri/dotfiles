#Exit immediately if a command exits with a non-zero status.
set -e 

echo -n "[Xcode Command Line Tools] installing..."
xcode-select --install && echo "installed: ✓"

echo -n "[HOMEBREW] installing..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && echo "installed: ✓"

echo -n "[HOMEBREW][Python2] installing..."
brew install python && echo "installed: ✓"

echo -n "[HOMEBREW][cmake] installing..."
brew install cmake && echo "installed: ✓"

echo -n "[HOMEBREW][Python3] installing..."
brew install python3 && echo "installed: ✓"

echo -n "[GIT] installing..."
brew install git && echo "installed: ✓"

echo -n "[ITERM2] installing..."
brew cask install iterm2 && echo "installed: ✓"

echo -n "[ITERM2][Oh My Zsh] installing..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && echo "installed: ✓"

echo -n "[ITERM2][Oh My Zsh][powerlevel9k] installing..."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k && echo "installed: ✓"

echo -n "[ITERM2][Oh My Zsh][powerlevel9k][nerdfont] installing..."
brew tap caskroom/fonts
brew cask install font-hack-nerd-font && echo "installed: ✓"

echo -n "[ITERM2][Oh My Zsh][zsh-autosuggestions] installing..."
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions && echo "installed: ✓ [Not active in default zshrc]"

echo -n "[ITERM2][Oh My Zsh][syntax-highlighting] installing..."
brew install zsh-syntax-highlighting && echo "installed: ✓"

echo "must backup existing dotfiles, git clone and install new dotfiles"
echo "must do the rcm thing so to have .dotfiles folder for spotifycontrol"

echo -n "[Dotfiles][rcm] installing..."
brew tap thoughtbot/formulae
brew install rcm && echo "installed: ✓"

echo -n "[Dotfiles][MyGitHub] cloning..."
git clone https://github.com/AlessandroSteri/dotfiles.git $HOME/.dotfiles && echo "cloned: ✓"

echo -n "[Dotfiles][.Dotfiles] installing..."
rcup -x install.sh && echo "installed: ✓"
echo "==========================="
echo "[Installed Dotfiles]:"
lsrc -x install.sh
echo "==========================="

echo -n "[Spotify]"
brew cask install spotify && echo "installed: ✓"

echo -n "[Spotify][SpotifyControl] installing..."
if [ ! -d $HOME/asDeveloper ]; then
	#echo "creating asDeveloper dir cause it doesen't exist"
	mkdir $HOME/asDeveloper
fi
#echo "clone spotify control and link it so it works as a command in terminal"
git clone https://github.com/dronir/SpotifyControl.git $HOME/asDeveloper/SpotifyControl
ln -s $HOME/asDeveloper/SpotifyControl /usr/local/bin/spotify && echo "installed: ✓"


echo -n "[APPSTORE cli-interface] installing..."
brew install mas && echo "installed: ✓"

echo "[APPSTORE][Xcode] installing...(must be installed before installing macvim"
mas install 497799835 && echo "[APPSTORE][Xcode] installed: ✓"

echo "maybe you need to manually open xcode before enter the pasword"
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer && echo "xcode-select: ✓"

#must be after xcode, i know linkapp is deprecated
echo -n "[macvim] installing..."
brew install macvim --override-system-vim && echo "installed: ✓"
#se non va perche deprecato prova: ln -s /usr/local/bin/mvim vim
brew linkapps macvim && echo "macvim linked: ✓"


echo -n "[APPSTORE][Notability] installing ..."
mas install 736189492 && echo "installed: ✓"

echo -n "[APPSTORE][Bear] installing..."
mas install 1091189122 && echo "installed: ✓"

echo "[APPSTORE] done."


echo -n "[SYSTEM PREFERENCE] changing scroll direction to not natural..." #needs log out for the change to take affect.
defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false && echo "changed: ✓"

echo -n "[SYSTEM PREFERENCE] setting keyboard speed and repeat to superhero..." #needs log out for the change to take affect.
defaults write NSGlobalDomain KeyRepeat -float 1.3 && defaults write NSGlobalDomain InitialKeyRepeat -int 11 && && echo "changed: ✓"



#!/bin/sh

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
	echo -n "[Vundle] installing..."
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim && echo "installed: ✓"
	echo "installed"
fi

# brew update
# brew cask install java 

#da capire come lanciare in modo non interattivo e se funziona echo installed
echo -n "[Vundle][PluginInstall] installing..."
vim -u $HOME/.vimrc.bundles +PluginInstall +qall && echo "installed: ✓"
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
echo "add ctags and tmux install"
echo "change keyboard to us"

# hw.tex" 5L, 103C
# vimtex: Skim is not installed!
# vimtex: latexmk is not executable
# vimtex: Compiler was not initialized!
# vimtex: bibtex is not executable!
#         bibtex completion is not available!

