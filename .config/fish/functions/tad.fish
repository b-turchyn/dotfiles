function tad --description 'Attach to a tmux session and detach other clients'
    if test -n "$argv[1]"; and not string match -q -- '-*' "$argv[1]"
        set argv -t $argv
    end
    tmux attach -d $argv
end
