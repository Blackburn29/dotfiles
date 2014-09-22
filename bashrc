
PS1="\[\033[1;34m\][\u@\h] \W \$\[\033[00m\] "

export EDITOR="vim"
export GOPATH="$HOME/Documents/Code/Go/"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.dotfiles/bin"

alias cls="clear"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"

source "$HOME/.dotfiles/bashrc.googlecloud"

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	export TERM="xterm-256color"
fi

