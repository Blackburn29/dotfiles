
#!/bin/bash

if ! [ -x "$(command -v rofi)" ]; then
  echo 'Error: Rofi is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

ROFI_CONFIG_DIR="$HOME/.config/rofi"
ROFI_CONFIG="$ROFI_CONFIG_DIR/rofi.rasi"
ROFI_THEME="$ROFI_CONFIG_DIR/slate.rasi"

if test -f "/etc/debian_version"; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer -y && \
        sudo apt-get update && \
        sudo apt-get install rofi
fi

mkdir -p "$ROFI_CONFIG_DIR"

if [ ! -h "$ROFI_CONFIG" ]; then
    ln -fs "$DIR/config.rasi" "$ROFI_CONFIG_DIR"
    ln -fs "$DIR/slate.rasi" "$ROFI_THEME"
fi
