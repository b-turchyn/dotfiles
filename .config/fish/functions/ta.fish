function ta --description 'Attach to a tmux session'
    if test -n "$argv[1]"; and not string match -q -- '-*' "$argv[1]"
        set argv -t $argv
    end
    tmux attach $argv
end
