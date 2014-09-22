#!/bin/bash

#the following should be the first content line of the script.
DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

PS1="\[\033[1;34m\][\u@\h] \W \$\[\033[00m\] "

alias cls="clear"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"

export EDITOR="vim"
export GOPATH="$HOME/Documents/Code/Go/"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$DIR/bin"

source "$DIR/bashrc.googlecloud"

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	export TERM="xterm-256color"
fi

