function to --description 'Create or attach to a tmux session'
    if test -n "$argv[1]"; and not string match -q -- '-*' "$argv[1]"
        set argv -s $argv
    end
    tmux new-session -A $argv
end
