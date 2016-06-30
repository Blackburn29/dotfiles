
#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

COMPTON_CONFIG_DIR="$HOME/.config"
COMPTON_CONFIG="$COMPTON_CONFIG_DIR/compton.conf"

mkdir -p "$COMPTON_CONFIG_DIR"

if [ ! -h "$COMPTON_CONFIG" ]; then
    ln -fs "$DIR/compton.conf" "$COMPTON_CONFIG_DIR"
fi
