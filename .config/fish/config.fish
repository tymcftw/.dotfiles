source /usr/share/cachyos-fish-config/cachyos-config.fish
# source (/usr/bin/starship init fish --print-full-init | psub)

# start ssh-agent if not running
if test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -s)
    set -x SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

if test -n "$SSH_AUTH_SOCK"
    ssh-add -l >/dev/null 2>&1; or ssh-add ~/.ssh/id_rsa >/dev/null 2>&1
end

# Export SSH_AUTH_SOCK from systemd user runtime dir
# set -x SSH_AUTH_SOCK (printf '%s/ssh-agent.sock' (systemd --user show-environment 2>/dev/null; echo $XDG_RUNTIME_DIR) )
# Fallback if above fails
if test -z "$SSH_AUTH_SOCK"
    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.sock
end

# tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='12-hour format' --rainbow_prompt_separators=Slanted --powerline_prompt_heads=Slanted --powerline_prompt_tails=Slanted --powerline_prompt_style='Two
# lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=Yes --prompt_spacing=Sparse --icons='Many icons' --transient=Yes

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

# pnpm
set -gx PNPM_HOME "/home/tymcftw/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias dotfiles 'git --git-dir=$DOTFILES_PATH/ --work-tree=$HOME'
set DOTFILES_PATH "$HOME/.dotfiles/"
set PATH /home/tymcftw/.cargo/bin /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin /usr/local/bin /usr/bin /bin /home/tymcftw/.local/bin /home/tymcftw/.local/share/pnpm /home/tymcftw/.local/share/swiftly/bin /usr/local/sbin /var/lib/flatpak/exports/bin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl

function hex2ascii
    echo $argv | string replace -a ' ' '' | xxd -r -p
    echo
end

function data2ascii
    echo $argv \
    | string replace -r '^Data\(' '' \
    | string replace -r '\.\.\..*$' '' \
    | string replace -r '\)$' '' \
    | string replace -a ' ' '' \
    | xxd -r -p
    echo
end

