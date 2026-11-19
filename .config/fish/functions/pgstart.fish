function pgstart --description 'Start a local PostgreSQL database created by pgup'
    if test (count $argv) -ne 1; or not string match -qr '^[a-zA-Z0-9_]+$' -- "$argv[1]"
        echo 'Usage: pgstart <dbname>' >&2
        return 2
    end
    set -l name "local-pg-$argv[1]"
    if test (docker inspect --format '{{ index .Config.Labels "local-pg.managed" }}' "$name" 2>/dev/null) != true
        echo "pgstart: no such managed database: $argv[1]" >&2
        return 1
    end
    docker start "$name"
end
