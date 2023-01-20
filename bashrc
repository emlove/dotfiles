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

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="~/.local/opt/android-platform-tools:$PATH"

# Gentoo's default PS1
# Change the window title of X terminals
case ${TERM} in
    [aEkx]term*|rxvt*|gnome*|konsole*|interix)
        PS1='\[\033]0;\u@\h:\w\007\]'
        ;;
    screen*)
        PS1='\[\033k\u@\h:\w\033\\\]'
        ;;
    *)
        unset PS1
        ;;
esac
if [[ ${EUID} == 0 ]] ; then
    PS1+='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
else
    PS1+='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

[[ -f "/usr/bin/virtualenvwrapper_lazy.sh" ]] && source /usr/bin/virtualenvwrapper_lazy.sh
[[ -f "/usr/local/bin/virtualenvwrapper_lazy.sh" ]] && source /usr/local/bin/virtualenvwrapper_lazy.sh

source ~/.profile

export HISTSIZE=20000
export HISTFILESIZE=20000

export SYSTEMD_EDITOR=vim

set -o vi

alias cplayer="CACA_DRIVER=ncurses mplayer -vo caca -quiet"

alias colors="terminal-colors -x"

alias unison="unison -ui text"

alias xclip="xclip -selection clipboard"

alias diff="colordiff"

alias ls="ls -N --color=auto"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export VISUAL="nvim"
export EDITOR="${VISUAL}"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Allow Ctrl-S and Ctrl-Q to passthrough to the terminal. This allows the
# Ctrl-S hotkey to be used during bash reverse history search
stty -ixon

export GPG_TTY=$(tty)

# Homechef
export PATH="/usr/local/opt/openssl@1.1/bin:/usr/local/opt/postgresql@11/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/postgresql@11/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/postgresql@11/include"

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Launch tmux
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] ; then
    LAST_DETACHED_SESSION=$(tmux ls -F '#{session_name}|#{?session_attached,attached,not attached}' 2>/dev/null | grep 'not attached$' | tail -n 1 | cut -d '|' -f1)
    if [[ -z "$LAST_DETACHED_SESSION" ]] ; then
        exec tmux new-session
    else
        exec tmux attach-session -t "${LAST_DETACHED_SESSION}"
    fi
fi
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/share/python:$PATH"

[[ -f "/usr/local/bin/python3" ]] && export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"

if [ -d ~/.rbenv ] ; then
    eval "$(rbenv init -)"
fi
