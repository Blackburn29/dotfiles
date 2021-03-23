#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

mkdir -p ~/.vim
ln -sf "$DIR/../vimrc" ~ && mv -f ~/vimrc ~/.vimrc

vimdirs=( plugin ftplugin ftdetect indent )
for vimdir in ${vimdirs[@]}; do
    mkdir -p "$DIR/vim/$vimdir"
    ln -sf "$DIR/vim/$vimdir" ~/.vim
done

#clone and install Vundle for vim.
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#Add neovim support
if [ -x "$(command -v nvim)" ]; then
    echo 'NeoVim detected. Adding .vimrc shim...'
    mkdir -p ~/.config/nvim && ln -sf "$DIR/../init.vim" "$HOME/.config/nvim/init.vim"
fi

vim +PluginInstall +qall


