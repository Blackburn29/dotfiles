#!/bin/bash

#the following should be the first content line of the script.
DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

#things to do in the home directory.
cd "$HOME"
ln -sf "$DIR/vimrc" .vimrc

if ! grep -q "source.*$DIR/bashrc" .bashrc; then
	echo -e "\nsource $DIR/bashrc\n" >> .bashrc
fi
cd "$DIR" &> /dev/null
#done with things in the home directory.

#clone and install Vundle for vim.
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
