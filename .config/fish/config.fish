if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

set -g fish_greeting

status --is-interactive; and rbenv init - fish | source
