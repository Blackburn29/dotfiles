#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty/"
ALACRITTY_CONFIG="$ALACRITTY_CONFIG_DIR/alacritty.yml"

if test -f "/etc/debian_version"; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer -y && \
        sudo apt-get update && \
        sudo apt-get install i3-gaps
fi

mkdir -p "$ALACRITTY_CONFIG_DIR"

if [ ! -h "$ALACRITTY_CONFIG" ]; then
    ln -fs "$DIR/alacritty.yml" "$ALACRITTY_CONFIG_DIR"
fi
