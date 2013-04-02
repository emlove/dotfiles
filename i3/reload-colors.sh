#!/bin/bash
cat ~/.i3/[0-9][0-9]* >~/.i3/config
for f in ~/.Xresources/*
do
    xrdb -merge $f
done
