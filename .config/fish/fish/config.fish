if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Source autojump.fish
begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

# Set locale
set -x LANG en_US.UTF-8

starship init fish | source

# opam configuration
source /home/erfan/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
