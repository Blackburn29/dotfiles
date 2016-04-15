
#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

I3_CONFIG_DIR="$HOME/.i3/"
I3_CONFIG="$I3_CONFIG_DIR/config"

mkdir -p "$I3_CONFIG_DIR"

if [ ! -h "$I3_CONFIG" ]; then
    ln -fs "$DIR/config" "$I3_CONFIG_DIR"
fi
