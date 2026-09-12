source /usr/share/cachyos-fish-config/cachyos-config.fish
# source (/usr/bin/starship init fish --print-full-init | psub)

## -- Tide Prompt Configuration ---------------------------------------- ##
# tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time='12-hour format' --rainbow_prompt_separators=Slanted --powerline_prompt_heads=Slanted --powerline_prompt_tails=Slanted --powerline_prompt_style='Two
# lines, character and frame' --prompt_connection=Disconnected --powerline_right_prompt_frame=Yes --prompt_spacing=Sparse --icons='Many icons' --transient=Yes

## -- End Tide Prompt Configuration ------------------------------------ ##

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
alias dotfiles='git --git-dir=/home/tymcftw/.dotfiles --work-tree=/'
alias dtig='GIT_DIR=/home/tymcftw/.dotfiles GIT_WORK_TREE=/ tig'

set SOPS_EDITOR nano
set EDITOR nano
set QT_QPA_PLATFORM xcb
set PAGER more
set DIFFPROG 'meld pacdiff -s'
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
set -gx fish_lsp_log_file /tmp/fish-lsp.log
