if status is-interactive
    # Commands to run in interactive sessions can go here

    # atuin for cmd history
    atuin init fish | source

    # alias
    alias cat='bat --style=plain'
    alias ls='eza'
    alias vi='nvim'
    alias vim='nvim'

    # zoxide
    zoxide init fish | source
    set -x _ZO_ECHO '1'
    alias cd='z'

    # starship
    starship init fish | source
end


function fish_greeting
    set_color yellow
    echo Welcome back, $USER!

    set_color green
    echo "Today is: " (date "+%A, %B %d, %Y")

    set_color cyan

    # Format the uptime to display only the necessary part
    echo "System uptime: " (uptime | awk '{print $3, $4}' | sed 's/,//')

    set_color normal
end

# key-rebinding
bind -e ctrl-p
bind -e ctrl-n
bind ctrl-comma up-or-search
bind ctrl-. down-or-search

# need this to enable screencast through xdg-desktop-portal-wlr
set -x XDG_CURRENT_DESKTOP sway
set -x XDG_SESSION_DESKTOP sway
set -x XDG_SESSION_TYPE wayland
set -x MOZ_ENABLE_WAYLAND 1

# Ruby Gem path (for htmlbeautifier and others).
# This require `sudo pacman -S ruby && gem install htmlbeautifier`
# NOTE: version may differ; verify via `gem env`
set -l gem_bin "$HOME/.local/share/gem/ruby/3.4.0/bin"
if test -d $gem_bin
    fish_add_path $gem_bin
end

function reload
    source ~/.config/fish/config.fish
    echo "Fish config reloaded!"
end
