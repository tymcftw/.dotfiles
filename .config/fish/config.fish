source /usr/share/cachyos-fish-config/cachyos-config.fish
# source (/usr/bin/starship init fish --print-full-init | psub)

## -- Tide Prompt Configuration ---------------------------------------- ##

# tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='12-hour format' --rainbow_prompt_separators=Slanted --powerline_prompt_heads=Slanted --powerline_prompt_tails=Slanted --powerline_prompt_style='Two
# lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=Yes --prompt_spacing=Sparse --icons='Many icons' --transient=Yes

## -- End Tide Prompt Configuration ------------------------------------ ##

####################################
## Start SSH Agent if not running ##
####################################
if not set -q SSH_AUTH_SOCK
    ssh-agent -c | source
end

# Export SSH_AUTH_SOCK from systemd user runtime dir
# set -x SSH_AUTH_SOCK (printf '%s/ssh-agent.sock' (systemctl --user show-environment 2>/dev/null; echo $XDG_RUNTIME_DIR))

#############################
## Fallback if above fails ##
#############################
# if not set -q SSH_AUTH_SOCK
#     set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.sock
# end

#################
## Tide Prompt ##
#################
# tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='12-hour format' --rainbow_prompt_separators=Slanted --powerline_prompt_heads=Slanted --powerline_prompt_tails=Slanted --powerline_prompt_style='Two
# lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=Yes --prompt_spacing=Sparse --icons='Many icons' --transient=Yes

##############
## Homebrew ##
##############
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

## -- Begin pnpm ------------------------------------------------------- ## 

set -gx PNPM_HOME "/home/tymcftw/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

## -- End pnpm --------------------------------------------------------- ##

## -- Aliases ---------------------------------------------------------- ##

# set DOTFILES_PATH "$HOME/.dotfiles/"
# alias dotfiles 'git --git-dir=$DOTFILES_PATH/ --work-tree=$HOME'
set PATH /home/tymcftw/.cargo/bin /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin /usr/local/bin /usr/bin /bin /home/tymcftw/.local/bin /home/tymcftw/.local/share/pnpm /home/tymcftw/.local/share/swiftly/bin /usr/local/sbin /var/lib/flatpak/exports/bin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl
set SOPS_EDITOR nano
set EDITOR nano
set QT_QPA_PLATFORM xcb

## -- End Aliases ------------------------------------------------------ ##

## -- Functions -------------------------------------------------------- ##

###############
## Hex2ascii ##
###############
function hex2ascii
    echo $argv | string replace -a ' ' '' | xxd -r -p
    echo
end

################
## Data2ascii ##
################
function data2ascii
    echo $argv \
    | string replace -r '^Data\(' '' \
    | string replace -r '\.\.\..*$' '' \
    | string replace -r '\)$' '' \
    | string replace -a ' ' '' \
    | xxd -r -p
    echo
end
