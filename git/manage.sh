#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"
RED='\033[0;91m'
NONE='\033[0m'

GITCONFIG_PATH="$HOME/.gitconfig"


# Probably not the best way to handle this, but I have many machines with many different user setups
# so I do not want to copy/link over existing configurations
if test -f "$GITCONFIG_PATH"; then
    echo "gitconfig already exists. checking for needed modifications..."
    if ! grep -qxF '[alias]' ~/.gitconfig ; then
        echo "Adding aliases to gitconfig..."
        cat "$DIR/aliases" >> $GITCONFIG_PATH
    else 
        echo -e "${RED}Alias block already exists in gitconfig. Skipping update.${NONE}"
    fi
else 
    echo -e "${RED}No gitconfig found. Nothing to do.${NONE}"
fi
