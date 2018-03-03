# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh


# NERD fonts

POWERLEVEL9K_MODE='nerdfont-complete'
# Awersome fonts
# POWERLEVEL9K_MODE='awesome-fontconfig'

if [[ -n $SSH_CONNECTION ]]; then
  echo "SSH session, using agnoster theme"
  ZSH_THEME="agnoster"
  export USER=``
  export HOST=``
else
  ZSH_THEME="powerlevel9k/powerlevel9k"
fi


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

DEFAULT_USER=$(whoami)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Hyphen-insensitive completion. Case sensitive completion must be off. _ and - interchangeable.
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
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


#awesome font
#source ~/.fonts/*.sh

source ~/.aliases
#segments display on one line, and print the command prompt below it

#####################################
#              PROMPT               #
#####################################

#POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Advanced `vi_mode` color customization
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='teal'

# Spotify integration in prompt
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

# ZSH Autocompletion
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o' '*.out' '*.log' '*.toc' '*.aux' '*.bbl' '*.pdf' '*.fdb_latexmk' '*.fls' '*.synctex.gz' '*.swp' '*.swo'

# Allow for local configuration
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
#Syntax highlighting should be at the end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
