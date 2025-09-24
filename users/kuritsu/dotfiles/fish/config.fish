status is-interactive; and begin
    if test "$TERM" != dumb
        starship init fish | source
    end
end

fish_add_path $HOME/.local/bin/

set -gx SHELL "fish"
