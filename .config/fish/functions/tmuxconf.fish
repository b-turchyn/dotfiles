function tmuxconf --description 'Edit the tmux configuration'
    set -l config ~/.tmux.conf
    set -l config_home ~/.config
    if test -n "$XDG_CONFIG_HOME"
        set config_home "$XDG_CONFIG_HOME"
    end
    if not test -e "$config"; and test -e "$config_home/tmux/tmux.conf"
        set config "$config_home/tmux/tmux.conf"
    end
    $EDITOR "$config"
end
