[ -e $HOME/.zconf ] && . $HOME/.zconf

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
