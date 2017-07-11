# zsh walters prompt
if [[ "$TERM" != "dumb" ]]; then
    export PROMPT='%B%(?..[%?] )%b%n@%U%m%u> '
    export RPROMPT="%F{${1:-green}}%~%f"
else
    export PROMPT="%(?..[%?] )%n@%m:%~> "
fi