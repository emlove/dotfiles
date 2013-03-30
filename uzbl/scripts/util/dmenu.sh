#!/bin/sh

DMENU_LINES=30

DMENU_FONT="UbuntuSans-8:normal"

. "/usr/share/uzbl/examples/data/scripts/util/dmenu.sh"

DMENU_COLORS="-nb #222222 -nf #888888 -sb #0771a6 -sf #eeeeee"

DMENU="dmenu $DMENU_ARGS $DMENU_COLORS"
