function ts --description 'Start a tmux session'
    if test -n "$argv[1]"; and not string match -q -- '-*' "$argv[1]"
        set argv -s $argv
    end
    tmux new-session $argv
end
