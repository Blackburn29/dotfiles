
#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

POLYBAR_CONFIG_DIR="$HOME/.config/polybar/"
POLYBAR_CONFIG="$POLYBAR_CONFIG_DIR/config"
POLYBAR_LAUNCH="$POLYBAR_CONFIG_DIR/launch.sh"

if test -f "/etc/debian_version"; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer -y && \
        sudo apt-get update && \
        sudo apt-get install polybar
fi

mkdir -p "$POLYBAR_CONFIG_DIR"

if [ ! -h "$POLYBAR_CONFIG" ]; then
    ln -fs "$DIR/config" "$POLYBAR_CONFIG_DIR"
    ln -fs "$DIR/launch.sh" "$POLYBAR_CONFIG_DIR"
fi
