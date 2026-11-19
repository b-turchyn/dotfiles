function pgup --description 'Create or start a local PostgreSQL database'
    set -l persist 0
    set -l fishenv 0
    set -l db
    for arg in $argv
        switch $arg
            case --persist
                set persist 1
            case --fishenv
                set fishenv 1
            case '-*'
                echo "pgup: unknown option $arg" >&2
                return 2
            case '*'
                if test -n "$db"
                    echo 'Usage: pgup [--persist] [--fishenv] <dbname>' >&2
                    return 2
                end
                set db $arg
        end
    end
    if not string match -qr '^[a-zA-Z0-9_]+$' -- "$db"
        echo 'pgup: dbname must contain only letters, numbers, and underscores' >&2
        return 2
    end

    set -l name "local-pg-$db"
    set -l exists (docker container inspect "$name" >/dev/null 2>&1; and echo yes)
    if test -z "$exists"
        set -l args run --detach --name "$name" --label local-pg.managed=true --publish '127.0.0.1::5432'
        if test $persist -eq 1
            set -a args --label local-pg.persist=true --mount "type=volume,source=local-pg-$db,target=/var/lib/postgresql/data"
        end
        set -a args --env "POSTGRES_DB=$db" --env "POSTGRES_USER=$db" --env "POSTGRES_PASSWORD=$db" --health-cmd 'pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"' --health-interval 1s --health-timeout 5s --health-retries 60 postgres:16-alpine
        docker $args >/dev/null; or return
    else
        set -l managed (docker inspect --format '{{ index .Config.Labels "local-pg.managed" }}' "$name" 2>/dev/null)
        if test "$managed" != true
            echo "pgup: container $name exists but is not managed by pgup" >&2
            return 1
        end
        if test (docker inspect --format '{{.State.Running}}' "$name") != true
            docker start "$name" >/dev/null; or return
        end
    end

    set -l state
    for attempt in (seq 1 60)
        set state (docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' "$name" 2>/dev/null)
        if test "$state" = healthy
            break
        end
        if test "$state" = unhealthy
            echo "pgup: PostgreSQL container $name failed its health check" >&2
            return 1
        end
        sleep 1
    end
    if test "$state" != healthy
        echo "pgup: timed out waiting for PostgreSQL container $name" >&2
        return 1
    end
    set -l port (docker port "$name" 5432/tcp | string split ':' | tail -n 1)
    if test -z "$port"
        echo "pgup: could not determine published port for $name" >&2
        return 1
    end
    if test $fishenv -eq 1
        printf 'set -gx PGHOST localhost\nset -gx PGPORT %s\nset -gx PGDATABASE %s\nset -gx PGUSER %s\nset -gx PGPASSWORD %s\n' "$port" "$db" "$db" "$db"
    else
        printf 'PGHOST=localhost\nPGPORT=%s\nPGDATABASE=%s\nPGUSER=%s\nPGPASSWORD=%s\n' "$port" "$db" "$db" "$db"
    end
end
