#!/bin/sh

set +e +E

COMMANDS="$(printf 'cd public_html/kittenlang\n')"
EXTRA=false
for TARGET in "$@"; do
    if [ "$TARGET" = "+" ]; then
        EXTRA=true
    elif [ "$EXTRA" = "true" ]; then
        COMMANDS="$(printf '%s\nput %s %s\n' "$COMMANDS" "$TARGET" "$TARGET")"
    else
        COMMANDS="$(printf '%s\nmkdir %s\nput %s %s\n' "$COMMANDS" "$TARGET" "$TARGET/index.html" "$TARGET/index.html")"
    fi
done

printf "%s\n" "$COMMANDS" | sftp purlouxc@purloux.com -

set -e -E
