#!/bin/bash

SDIR="$HOME/.config/polybar/scripts"

MENU="$(rofi -sep "|" -dmenu -i -p 'Select' -location 5 -xoffset -250 -yoffset -45 -columns 1 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 2 <<< "wlp3s0|enp4s0")"

case "$MENU" in
	*wlp3s0) $SDIR/wifi.sh -wl ;;
	*enp4s0) $SDIR/wifi.sh -w ;;
esac
