typeset -U path
path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    "$HOME/.local/share/pnpm"
    "$HOME/.rml"
    $path
)

export PATH
export QT_STYLE_OVERRIDE=gtk
export WLR_RENDERER=vulkan
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
fi
