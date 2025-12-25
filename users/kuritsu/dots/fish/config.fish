status is-interactive; and begin
    if type -q direnv
        direnv hook fish | source
    end
    if test "$TERM" != dumb; and type -q starship
        starship init fish | source
    end
    if test -f /run/.containerenv
        fish_add_path $HOME/.local/bin/
    end
end

set -gx SHELL "fish"
set -gx GPG_TTY "$(tty)"
