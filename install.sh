#!/bin/bash

#the following should be the first content line of the script.
DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

VIMRC_NAME="vimrc"

cd "$HOME"
ln -sf "$DIR/$VIMRC_NAME" .vimrc

if ! grep -q "source.*$DIR/bashrc" .bashrc; then
	echo -e "\nsource $DIR/bashrc\n" >> .bashrc
fi
cd "$DIR" &> /dev/null
