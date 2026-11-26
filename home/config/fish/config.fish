set UID (id -u)
set -g fish_key_bindings fish_vi_key_bindings
function fish_user_key_bindings
    # Bind Alt+O in insert mode to switch to default (normal) mode and refresh the UI
    bind -M insert -m default \eo backward-char force-repaint

    # Bind Alt+W in insert mode to match Ctrl+W
    # bind -M insert \ew backward-kill-path-component
end

# set -gx NOUVEAU_USE_ZINK '1'
# set -gx DRI_PRIME '1'

# set -gx COLORTERM truecolor
set -gx EDITOR hx
set -gx VISUAL hx
# set -gx EDITOR nvim
# set -gx VISUAL nvim

set -gx SDL_IM_MODULE fcitx
set -gx XMODIFIERS '@im=fcitx'
set -gx GTK_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx

set -gx GOPATH $HOME/.local/share/go
set -gx CARGO_HOME $HOME/.local/share/cargo

set -gx XDG_CACHE_HOME "$HOME"'/.cache'
set -gx XDG_CONFIG_HOME "$HOME"'/.config'
set -gx XDG_DATA_HOME "$HOME"'/.local/share'
set -gx XDG_DESKTOP_DIR "$HOME"'/Desktop'
set -gx XDG_DOCUMENTS_DIR "$HOME"'/Documents'
set -gx XDG_DOWNLOAD_DIR "$HOME"'/Downloads'
set -gx XDG_MUSIC_DIR "$HOME"'/Music'
set -gx XDG_PICTURES_DIR "$HOME"'/Pictures'
set -gx XDG_STATE_HOME "$HOME"'/.local/state'
set -gx XDG_VIDEOS_DIR "$HOME"'/Videos'

set -q PATH; or set -g PATH # Ensure it exists
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.config/swm/bin
fish_add_path $HOME/.opencode/bin
fish_add_path $HOME/.local/share/go/bin
fish_add_path $HOME/.local/share/cargo/bin

set -g fish_color_param 879A39 --bold
set -g fish_color_error cf6679 --bold
set -g fish_color_autosuggestion 908caa --bold
set -g fish_color_selection --reverse --bold

status is-login; and begin

end

status is-interactive; and begin

    if type -q direnv
        direnv hook fish | source
    end
    if test -e ~/.nix-profile/etc/profile.d/nix.fish
        source ~/.nix-profile/etc/profile.d/nix.fish
    end

    alias e yazi
    alias vi hx
    # zoxide init fish | source
    zoxide init fish --cmd cd | source
    fastfetch
    echo "				Welcome back, $USER!"

end
