#!/bin/bash

#the following should be the first content line of the script.
DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

VIMRC_NAME="vimrc"

cd ~
ln -sf "$DIR/$VIMRC_NAME" .vimrc
cd - > /dev/null
