#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar --config=~luc/.config/polybar/config.ini mybar &
#polybar bar2 &

echo "Bars launched..."
