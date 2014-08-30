
PS1="\[\033[1;34m\][\u@\h] \W \$\[\033[00m\] "

export EDITOR="vim"
export GOPATH="$HOME/Documents/Code/Go/"
export PATH="$PATH:$HOME/.bin"

alias cls="clear"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias gs="git status"
alias gp="git push"

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.bash.inc"

# The next line enables bash completion for gcloud.
source "$HOME/google-cloud-sdk/completion.bash.inc"

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	export TERM="xterm-256color"
fi

