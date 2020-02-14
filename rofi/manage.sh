
#!/bin/bash

if ! [ -x "$(command -v rofi)" ]; then
  echo 'Error: Rofi is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

ROFI_CONFIG_DIR="$HOME/.config/rofi"
ROFI_CONFIG="$ROFI_CONFIG_DIR/rofi.rasi"

mkdir -p "$ROFI_CONFIG_DIR"

if [ ! -h "$ROFI_CONFIG" ]; then
    ln -fs "$DIR/rofi.rasi" "$ROFI_CONFIG_DIR"
fi
