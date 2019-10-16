
#!/bin/bash

if ! [ -x "$(command -v compton)" ]; then
  echo 'Error: Compton is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

COMPTON_CONFIG_DIR="$HOME/.config"
COMPTON_CONFIG="$COMPTON_CONFIG_DIR/compton.conf"

mkdir -p "$COMPTON_CONFIG_DIR"

if [ ! -h "$COMPTON_CONFIG" ]; then
    ln -fs "$DIR/compton.conf" "$COMPTON_CONFIG_DIR"
fi
