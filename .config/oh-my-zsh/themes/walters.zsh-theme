# zsh walters prompt

ps_salt="uuuuuuuuuuuuu"
# ps_salt="manyshellcolors"

ps_color="$((0x$( (echo "$ps_salt"; echo $i) | sha256sum | cut -f1 -d' ' | tr -d '\n' | tail -c2)))"
if [ "$ps_color" -le 10 ]; then
  ps_color="$((ps_color + 30))"
fi
if [ "$ps_color" -le 20 ]; then
  ps_color="$((ps_color + 10))"
fi
if [ "$ps_color" -gt 240 ]; then
  ps_color="$((ps_color - 20))"
fi

if [[ "$TERM" != "dumb" ]]; then
    export PROMPT="%B%(?..[%?] )%b%n@%U%{$FG[$ps_color]%}%m%{$reset_color%}%u> "
    export RPROMPT="%F{${1:-green}}%~%f"
else
    export PROMPT="%(?..[%?] )%n@%m:%~> "
fi
