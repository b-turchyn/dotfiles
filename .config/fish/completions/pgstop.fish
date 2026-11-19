complete -c pgstop -f -a '(docker ps --all --filter label=local-pg.managed=true --format "{{.Names}}" | string replace -r "^local-pg-" "")'
