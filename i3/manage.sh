
#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

I3_CONFIG_DIR="$HOME/.config/i3/"
I3_CONFIG="$I3_CONFIG_DIR/config"

if test -f "/etc/debian_version"; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer -y && \
        sudo apt-get update && \
        sudo apt-get install i3-gaps
fi

mkdir -p "$I3_CONFIG_DIR"

if [ ! -h "$I3_CONFIG" ]; then
    ln -fs "$DIR/config" "$I3_CONFIG_DIR"
fi
