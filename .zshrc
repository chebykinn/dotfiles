SHELL_DIR="$HOME/.config/shell"
. "$SHELL_DIR/var"
. "$SHELL_DIR/config"
. "$SHELL_DIR/function"
. "$SHELL_DIR/alias"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/ivan/yandex-cloud/path.bash.inc' ]; then source '/home/ivan/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/ivan/yandex-cloud/completion.zsh.inc' ]; then source '/home/ivan/yandex-cloud/completion.zsh.inc'; fi

