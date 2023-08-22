#!/bin/bash

if ! [ -x "$(command -v hyprctl)" ]; then
  echo 'Error: hyprland is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

HYPRLAND_CONFIG_DIR="$HOME/.config/hypr"
HYPRLAND_CONFIG="$HYPRLAND_CONFIG_DIR/hyprland.conf"

mkdir -p "$HYPRLAND_CONFIG_DIR"

if [ ! -h "$HYPRLAND_CONFIG" ]; then
    ln -fs "$DIR/hyprland.conf" "$HYPRLAND_CONFIG_DIR"
    ln -fs "$DIR/xdg-portal-hyprland" "$HYPRLAND_CONFIG_DIR"
fi
