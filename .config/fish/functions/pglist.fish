function pglist --description 'List local PostgreSQL databases created by pgup'
    docker ps --all --filter label=local-pg.managed=true --format '{{.Names}}\t{{.Status}}' | string replace -r '^local-pg-' ''
end
