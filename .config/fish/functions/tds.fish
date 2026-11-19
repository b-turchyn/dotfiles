function tds --description 'Create or attach to a tmux session for this directory'
    # Sanitize tmux target syntax and distinguish directories with the same basename.
    set -l name "$(string replace -r '(?s)^.*/' '' -- "$PWD" | string replace -ra '[.:]|^[$@%=]' '_')"
    set -l hash (printf '%s' "$PWD" | md5sum | string sub -l 6)
    tmux new-session -A -s "$name-$hash"
end
