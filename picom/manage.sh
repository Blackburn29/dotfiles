
#!/bin/bash

if ! [ -x "$(command -v picom)" ]; then
  echo 'Error: Picom is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

PICOM_CONFIG_DIR="$HOME/.config"
PICOM_CONFIG="$PICOM_CONFIG_DIR/picom.conf"

mkdir -p "$PICOM_CONFIG_DIR"

if [ ! -h "$PICOM_CONFIG" ]; then
    ln -fs "$DIR/picom.conf" "$PICOM_CONFIG_DIR"
fi
