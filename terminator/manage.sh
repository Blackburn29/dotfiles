
#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

TERMINATOR_CONFIG_DIR="$HOME/.config/terminator"
TERMINATOR_CONFIG="$TERMINATOR_CONFIG_DIR/config"

mkdir -p "$TERMINATOR_CONFIG_DIR"

if [ ! -h "$TERMINATOR_CONFIG" ]; then
    ln -fs "$DIR/config" "$TERMINATOR_CONFIG_DIR"
fi
