# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="walters"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

CASE_SENSITIVE="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux)

setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals

#==============================================================================

# Variables


export BROWSER='opera'
export LESS="-FX"
export R="$HOME/root"
export RD="$R/data"
export RDT="$RD/tests"
export DEV="$RD/dev"
export SDEV="$DEV/synced"
export SNIPPETS="$SDEV/snippets"
export U="$RD/university"
export EDITOR='vim'
export BTARGET="x86_64-unknown-linux-gnu"
export MANPATH=$HOME/.multirust/toolchains/nightly-$BTARGET/share/man:$MANPATH
export WINEPATH="$HOME/.wine"
export WINEPATH32="$HOME/.wine32"
export QT_STYLE_OVERRIDE=gtk

unset SSH_ASKPASS

#==============================================================================

# Aliases


alias itmossh='ssh helios'
alias ls='ls --color=always --group-directories-first'
alias rm='rm -i'
alias srestart='sudo systemctl restart'
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'
alias senable='sudo systemctl enable'
alias sdisable='sudo systemctl disable'
alias sstatus='sudo systemctl status'
alias weather='curl wttr.in'
alias wine32="WINEPREFIX=$WINEPATH32 wine"
alias g="git"

#==============================================================================

#Disable Ctrl+S
stty -ixon

#Disable fucking beep!!!
[ -n "$DISPLAY" ] && xset -b

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[30;43m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

eval $(dircolors ~/.dircolors)
# colored completion - use my LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
