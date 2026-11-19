function bw-unlock --description 'Log in to Bitwarden if needed and export its CLI session for this fish shell'
    set -l state (bw status --raw | jq -r .status)
    or return

    if test "$state" = unauthenticated
        bw login
        or return
    end

    set -gx BW_SESSION (bw unlock --raw)
    or return
    echo 'Bitwarden unlocked for this shell.'
end
