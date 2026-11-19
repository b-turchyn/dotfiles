function mkcd --description 'Create a directory and enter it'
    mkdir -p -- $argv[1]; or return
    cd -- $argv[1]
end
