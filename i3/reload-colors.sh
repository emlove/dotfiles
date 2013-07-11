#!/bin/bash
cat ~/dotfiles/i3/[0-9][0-9]* >~/dotfiles/i3/config
for f in ~/.Xresources/*
do
    xrdb -merge $f
done

cat ~/dotfiles/i3status/[0-9][0-9]* > ~/dotfiles/i3status/i3status.conf

cat ~/dotfiles/uzbl/[0-9][0-9]* > ~/dotfiles/uzbl/config
