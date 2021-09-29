#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

mkdir -p ~/.vim
ln -sf "$DIR/../vimrc" ~ && mv -f ~/vimrc ~/.vimrc

vimdirs=( plugged ftplugin ftdetect indent )
for vimdir in ${vimdirs[@]}; do
    mkdir -p "$DIR/$vimdir"
    ln -sf "$DIR/$vimdir" ~/.vim
done

#clone and install vim-plug
if [ -x "$(command -v nvim)" ]; then
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#Add neovim support
if [ -x "$(command -v nvim)" ]; then
    echo 'NeoVim detected. Adding .vimrc shim...'
    mkdir -p ~/.config/nvim && ln -sf "$DIR/../init.vim" "$HOME/.config/nvim/init.vim"
    nvim +PlugInstall
else
    vim +PlugInstall
fi

if [ -d "$HOME/.vim/plugged/YouCompleteMe" ]; then
    cd $HOME/.vim/plugged/YouCompleteMe && \
        ./install.sh && \
        cd -
fi



