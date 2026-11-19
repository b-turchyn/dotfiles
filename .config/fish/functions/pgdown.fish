function pgdown --description 'Remove a local PostgreSQL database created by pgup'
    if test (count $argv) -ne 1; or not string match -qr '^[a-zA-Z0-9_]+$' -- "$argv[1]"
        echo 'Usage: pgdown <dbname>' >&2
        return 2
    end
    set -l name "local-pg-$argv[1]"
    if not docker inspect --type container "$name" >/dev/null 2>&1
        echo "pgdown: no such managed database: $argv[1]" >&2
        return 1
    end
    if test (docker inspect --format '{{ index .Config.Labels "local-pg.managed" }}' "$name") != true
        echo "pgdown: refusing to remove unmanaged container $name" >&2
        return 1
    end
    set -l persisted (docker inspect --format '{{ index .Config.Labels "local-pg.persist" }}' "$name")
    docker rm --force --volumes "$name" >/dev/null; or return
    if test "$persisted" = true
        docker volume rm "local-pg-$argv[1]" >/dev/null; or return
    end
end
