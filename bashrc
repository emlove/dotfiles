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

source ~/.profile

set -o vi

alias cplayer="CACA_DRIVER=ncurses mplayer -vo caca -quiet"

alias colors="terminal-colors -x"

alias unison="unison -ui text"

alias xclip="xclip -selection clipboard"

alias diff="colordiff"

keychain -q ~/.ssh/id_rsa
. ~/.keychain/$HOSTNAME-sh
. ~/.keychain/$HOSTNAME-sh-gpg
