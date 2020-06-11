#!/bin/bash

PDIR="$HOME/.config/polybar"
PID="$(pgrep -u $UID -x polybar)"

if [[ $1 = "-wl" ]]; then
	sed -i 's/enp4s0/wlp3s0/g' $PDIR/config.ini
	sed -i 's/Wired/Wireless/g' $PDIR/config.ini
	polybar-msg -p $PID cmd restart

elif [[ $1 = "-w" ]]; then
	sed -i 's/wlp3s0/enp4s0/g' $PDIR/config.ini
	sed -i 's/Wireless/Wired/g' $PDIR/config.ini
	polybar-msg -p $PID cmd restart
fi
