export R="$HOME/root"
export RD="$R/data"
export RDT="$RD/tests"
export RSFW="$RD/software"
export RBIN="$RSFW/bin"
export RPKG="$RSFW/pkg"
export ROPT="$RSFW/opt"
export RSRC="$RSFW/src"
export DEV="$RD/dev"
export SDEV="$DEV/synced"
export SNIPPETS="$SDEV/snippets"
export EDITOR="vim"
export BROWSER="xdg-open"
export LESS="-FXx4"
export GIMP2_DIRECTORY="$HOME/.config/gimp"
export GNUPGHOME="$HOME/.config/gnupg"
export WINEPATH="$HOME/.wine"
export WINEPATH32="$HOME/.wine32"
export MAKEFLAGS="-j$(nproc)"

alias ls="/bin/ls --color=always --group-directories-first $@"
alias l="/bin/ls --color=always --group-directories-first -lah $@ | less -RM"
alias rm="rm -i"
alias vim="nvim"
alias vvim="/usr/bin/vim"
alias wine32="WINEPREFIX=$WINEPATH32 wine"

# Path to your oh-my-zsh installation.
ZSH="$HOME/.local/share/oh-my-zsh/"
ZSH_CUSTOM="$HOME/.config/oh-my-zsh/"

ZSH_THEME="walters"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"

plugins=(git tmux fzf ssh-agent)

setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_FIXTERM="true"

FZF_BASE="$HOME/.local/share/fzf"

source $ZSH/oh-my-zsh.sh
