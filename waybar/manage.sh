#!/bin/bash

if ! [ -x "$(command -v waybar)" ]; then
  echo 'Error: waybar is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
WAYBAR_CONFIG="$WAYBAR_CONFIG_DIR/config"

mkdir -p "$WAYBAR_CONFIG_DIR"

if [ ! -h "$WAYBAR_CONFIG" ]; then
    ln -fs "$DIR/config" "$WAYBAR_CONFIG_DIR"
    ln -fs "$DIR/style.css" "$WAYBAR_CONFIG_DIR"
    ln -fs "$DIR/mediaplayer.py" "$WAYBAR_CONFIG_DIR"
fi
