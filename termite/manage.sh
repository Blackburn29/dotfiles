#!/bin/bash

if ! [ -x "$(command -v termite)" ]; then
  echo 'Error: Termite is not installed.' >&2
  exit 0
fi

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

TERMITE_CONFIG_DIR="$HOME/.config/termite"
TERMITE_CONFIG="$TERMITE_CONFIG_DIR/config"

mkdir -p "$TERMITE_CONFIG_DIR"

if [ ! -h "$TERMITE_CONFIG" ]; then
    ln -fs "$DIR/config" "$TERMITE_CONFIG_DIR"
fi
