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

    #Add neovim support
    if [ -x "$(command -v nvim)" ]; then
        echo 'NeoVim detected. Adding .vimrc shim...'
        mkdir -p ~/.config/nvim && ln -sf "$DIR/init.vim" "$HOME/.config/nvim/init.vim"
    fi

    vim +PluginInstall +qall
}

manage_terminator() {
    bash ./terminator/manage.sh
}

manage_i3() {
    bash ./i3/manage.sh
}

manage_compton() {
    bash ./compton/manage.sh
}

manage_conky() {
    bash ./conky/manage.sh
}

manage_polybar() {
    bash ./polybar/manage.sh
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
        terminator)
            manage_terminator;;
        i3)
            manage_i3;
            manage_polybar;;
        compton)
            manage_compton;;
        conky)
            manage_conky;;
        polybar)
            manage_polybar;;
    esac
done
