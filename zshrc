# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_MODE='awesome-fontconfig'

ZSH_THEME="powerlevel9k/powerlevel9k"

DEFAULT_USER="alessandrosteri"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx)

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

source $ZSH/oh-my-zsh.sh

#######################################################################################################
# User configuration
#######################################################################################################

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#awesome font
#source ~/.fonts/*.sh

#rep here recursive case insensitive
#grh() { grep -RnIi "$1" .; }

#ls on every cd
cs() { cd "$1" && ls; }

#sudo for super fast sudo latest cmd with S !!
alias S='sudo'

#fast source bash
alias src='source ~/.zshrc'

#spotify
alias s='spotify'

#alias for common dotfiles
alias vimrc='vim ~/.vimrc'
alias vimrcb='vim ~/.vimrc.bundles'
alias zshrc='vim ~/.zshrc'
alias tmuxconf='vim ~/.tmux.conf'
alias altvim='vim -u ~/Desktop/BACKUP\ VIMRC/vimrc'

#make new dir and change to new dir
mkcd() { mkdir "$1" && cd "$1"; }

#make new dir and change to new dir TODO: insert control, if only one arg print usage dirname filename
mktc() { mkdir "$1" && cd "$1" && touch "$2" && cd ..; }

#shortcut for parent of parent dir
alias ...="../../"

alias mgsnt="/Users/alessandrosteri/asDeveloper/texmf/tex/mgsnt/mgsnt.sh"

#alias cdroot ="cd /" #not working

#alias cdhome = cd "~" #non serve perche basta cd solo

#clear terminal
alias c='clear'

# allow using unix-like command tree in osx
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

#allow using macvim
alias e="mvim -v"

#fast alias, -p opens one tab for each file
alias v="vim -p"
#open vim read only
alias vr="vim -R"

alias V="sudo vim -p"

#shortcut for latex
alias vv="vim -p content.tex"

#sublime txt from shell
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl --new-window $@'

# iterm2 notify on completion usage cmnd; notify
alias notify="tput bel"
#use brew ctag (exuberant) instead of BSD ctag  to allow -R flag
alias ctags="`brew --prefix`/bin/ctags"

#add path for pandoc
#export PATH=$PATH:/Users/alessandrosteri/.local/bin
#segments display on one line, and print the command prompt below it
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Advanced `vi_mode` color customization
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='teal'
prompt_zsh_showStatus () {
    local color='%F{black}'
  state=`osascript -e 'tell application "Spotify" to player state as string'`;
  if [ $state = "playing" ]; then
    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
    track=`osascript -e 'tell application "Spotify" to name of current track as string'`;

    # echo -n "$artist - $track";
    echo -n "%{$color%} $artist - $track " ;
  fi
}
#cutomize right prompt add: context
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user root_indicator dir rbenv vcs dir_writable)

#cutomize right prompt add:  time host
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ip zsh_showStatus) # history background_jobs  ip zsh_showStatus)

POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

# POWERLEVEL9K_PROMPT_ON_NEWLINE=true


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#clean cwd by removing all file
#alias cleancwd="rm -rf *"

#cd to desktop
alias cdd="cd ~/Desktop"

#Syntax highlighting should be at the end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
