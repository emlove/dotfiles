# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

if [ "$TERM" == "screen" ] ; then
    export TERM="screen-256color"
fi

[[ -f "/usr/bin/virtualenvwrapper_lazy.sh" ]] && source /usr/bin/virtualenvwrapper_lazy.sh

source ~/.profile

export HISTSIZE=20000
export HISTFILESIZE=20000

set -o vi

alias cplayer="CACA_DRIVER=ncurses mplayer -vo caca -quiet"

alias colors="terminal-colors -x"

alias unison="unison -ui text"

alias xclip="xclip -selection clipboard"

alias diff="colordiff"

alias ls="ls -N --color=auto"

# export NVM_DIR="/home/emily/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# export PATH="$HOME/.yarn/bin:$PATH"
#
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]]; then
    exec tmux new-session -A -s default
fi
