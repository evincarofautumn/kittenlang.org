#!/bin/sh

set +e +E

COMMANDS="$(printf 'cd public_html/kittenlang\n')"
for TARGET in "$@"; do
    COMMANDS="$(printf '%s\nmkdir %s\nput %s %s\n' "$COMMANDS" "$TARGET" "$TARGET/index.html" "$TARGET/index.html")"
done

printf "%s\n" "$COMMANDS" | sftp purlouxc@purloux.com -

set -e -E
