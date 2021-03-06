# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# disable warnings from zsh producing i/o
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

export PATH=$PATH":/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"

export PATH=$PATH":$HOME/.dotfiles/utils/custom_commands"

# to solve double completion in Hyper terminal
LC_CTYPE=en_US.UTF-8

# NERD fonts
POWERLEVEL9K_MODE='nerdfont-complete'
# Awersome fonts
# POWERLEVEL9K_MODE='awesome-fontconfig'

if [[ -n $SSH_CONNECTION ]]; then
  echo "SSH session, using agnoster theme"
  ZSH_THEME="agnoster"
  export USER=``
  # export HOST=``
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
  DEFAULT_USER=$(whoami)
fi

case "$OSTYPE" in
  linux*)   ZSH_THEME="agnoster" ;;
# darwin*)  echo "OSX" ;;
# win*)     echo "Windows" ;;
# cygwin*)  echo "Cygwin" ;;
# bsd*)     echo "BSD" ;;
# solaris*) echo "SOLARIS" ;;
# *)        echo "unknown: $OSTYPE" ;;
esac

# auto tmux if over ssh
if [[ -z "$TMUX"  ]] && [ "$SSH_CONNECTION" != ""  ]; then
    tmux attach-session -t main || tmux new-session -s main
fi

# Hyphen-insensitive completion. Case sensitive completion must be off. _ and - interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# sl -la /tmp
# zsh: correct 'sl' to 'ls' [nyae]? no, yes, abort, edit command
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(git osx) # hacker-quotes)

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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user root_indicator dir vcs dir_writable)

#cutomize right prompt add:  time host
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status) # zsh_showStatus) # wifi) # ip) # zsh_showStatus) # history background_jobs  ip zsh_showStatus)

POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

# POWERLEVEL9K_PROMPT_ON_NEWLINE=true


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# PURE
# autoload -U promptinit; promptinit
# prompt pure

# ZSH Autocompletion
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o' '*.out' '*.log' '*.toc' '*.aux' '*.bbl' '*.pdf' '*.fdb_latexmk' '*.fls' '*.synctex.gz' '*.swp' '*.swo' '*.tdo' '*.pyc'


# codi() {
#   local syntax="${1:-python}"
#   shift
#   nvim -c \
#     "let g:startify_disable_at_vimenter = 1 |\
#     set bt=nofile ls=0 noru nonu nornu |\
#     hi ColorColumn ctermbg=NONE |\
#     hi VertSplit ctermbg=NONE |\
#     hi NonText ctermfg=0 |\
#     Codi $syntax" "$@"
# }

codi() {
   local syntax="${1:-python}"
   shift
   nvim -c \
     "let g:startify_disable_at_vimenter = 1 |\
     set bt=nofile ls=0 noru nonu nornu |\
     hi CodiVirtualText guifg=red
     hi ColorColumn ctermbg=NONE |\
     hi VertSplit ctermbg=NONE |\
     hi NonText ctermfg=0 |\
     Codi $syntax" "$@"
}


#######################################################
###################### at the END #####################
#######################################################
# Allow for local configuration
test -f $HOME/.zshrc.local && source $HOME/.zshrc.local
#Syntax highlighting should be at the end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
