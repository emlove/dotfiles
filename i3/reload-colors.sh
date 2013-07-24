#!/bin/bash

# Merge config files that needed to be seperated
cat ~/dotfiles/i3/[0-9][0-9]* >~/dotfiles/i3/config
cat ~/dotfiles/i3status/[0-9][0-9]* > ~/dotfiles/i3status/i3status.conf
cat ~/dotfiles/uzbl/[0-9][0-9]* > ~/dotfiles/uzbl/config

# Apply all files in .Xresources
for f in ~/.Xresources/*
do
    xrdb -merge $f
done

# Apply wallpaper
feh --no-xinerama --bg-center '/home/adam/dotfiles/color-themes/current-theme/wallpaper.png'
