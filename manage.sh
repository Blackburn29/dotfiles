#!/bin/bash

#the following should be the first content line of the script.
DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

manage_bash() {
    if [ ! -d "$DIR/self" ]; then
        mkdir "$DIR/self" && echo "Made the self directory for you. Put .sh files here."
    fi

    #add a source line to ~/.bashrc to source this file if it does not already exist.
    if ! grep -q "source.*$DIR/bashrc" ~/.bashrc; then
        echo -e "\nsource $DIR/bashrc\n" >> ~/.bashrc
    fi
}

manage_vim() {
    mkdir -p ~/.vim
    ln -sf "$DIR/vimrc" ~ && mv -f ~/vimrc ~/.vimrc

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
    vim +PluginInstall +qall
}

args="$@"
if [ "$#" -eq 0 ]; then
    args=( bash vim )
fi
for arg in ${args[@]}; do
    case "$arg" in
        bash)
            manage_bash;;
        vim)
            manage_vim;;
    esac
done
