#!/bin/sh

source ~/dotfiles/color-themes/current-theme/dmenu_colors

DMENU_LINES=30

DMENU_FONT="UbuntuSans-8:normal"

source "/usr/share/uzbl/examples/data/scripts/util/dmenu.sh"

DMENU_COLORS="-sf ${SELECTED_FOREGROUND} -sb ${SELECTED_BACKGROUND} -nf ${OTHER_FOREGROUND} -nb ${OTHER_BACKGROUND}"

DMENU="dmenu $DMENU_ARGS $DMENU_COLORS"
