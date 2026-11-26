source /usr/share/cachyos-fish-config/cachyos-config.fish

set -gx EDITOR vim

fish_add_path ~/.local/share/pnpm/bin

# Git shortcuts (interactive abbreviations; they expand before execution).
if status is-interactive
    # git
    abbr --add ga 'git add'
    abbr --add gb 'git branch'
    abbr --add gc 'git commit'
    abbr --add gco 'git checkout'
    abbr --add gcp 'git cherry-pick'
    abbr --add gd 'git diff'
    abbr --add gds 'git diff --staged'
    abbr --add gl 'git pull'
    abbr --add glol 'git log --graph --decorate --oneline'
    abbr --add glola 'git log --graph --decorate --oneline --all'
    abbr --add gp 'git push'
    abbr --add gpf 'git push --force-with-lease'
    abbr --add gst 'git status --short --branch'
    abbr --add gsta 'git stash push'
    abbr --add gstp 'git stash pop'
    abbr --add gsw 'git switch'
    abbr --add gswc 'git switch --create'
    abbr --add gup 'git pull --rebase'
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Pi
fish_add_path "/home/lightstalker/.local/share/pnpm/store/v11/links/@/node/24.19.0/8f8adc8a32f090f436e7c4a07b225f546aa14c5663b0ee2a8684c78c4dcf7f35/node_modules/node/bin"
