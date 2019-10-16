
#!/bin/bash

if ! [ -x "$(command -v conky)" ]; then
  echo 'Error: Conky is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

CONKY_CONFIG_DIR="$HOME/.config/conky/"
CONKY_CONFIG="$CONKY_CONFIG_DIR/compton.conf"

mkdir -p "$CONKY_CONFIG_DIR"

if [ ! -h "$CONKY_CONFIG" ]; then
    ln -fs "$DIR/conky.conf" "$CONKY_CONFIG_DIR"
fi

