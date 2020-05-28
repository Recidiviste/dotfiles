#!/bin/bash

#######
# TMP #
#######
mkdir /tmp/qutebrowser

##################
# Usual cleaning #
##################
rm -f ~/.python_history
rm -f ~/.lesshst ~/.wget-hsts

##########
# Basics #
##########

systemctl --user import-environment DISPLAY # To permit to dunst to work
setxkbmap -layout fr # Put the keyboard in azerty
xmodmap $HOME/.Xmodmap # Custom keyboard mappings
xsetroot -cursor_name left_ptr # Basic cursor and not a cross
sxhkd & # Start Simple Hotkey Daemon
$HOME/.fehbg # Restore last wallpaper
# $HOME/.local/bin/random-wall # Random wallpaper


#########################
# Programs to autostart #
#########################

picom -fb --dbus & # Compositor
$HOME/.config/polybar/launch.sh & # Polybar
$HOME/bin/regen-wall-list # Recreate wall list
xautolock -locker "~/.local/bin/i3lock-blue.sh" -time 15 & # Autolock
mpd & # Music Player Daemon


###########
# Applets #
###########

nm-applet & # Network Manager
copyq & # CopyQ
clipmenud & # Dmenu clipboard


####################
# GUI Applications #
####################

discord & # Discord
sleep 5; termite --name="ncmpcpp" --class="ncmpcpp" -e ncmpcpp & bspc rule -a ncmpcpp:ncmpcpp desktop='^1' &
sleep 5; termite --name="calcurse" --class="calcurse" -e calcurse & bspc rule -a calcurse:calcurse desktop='^10' &
# Spawn a terminal with ncmpcpp so I can have my interface to MPD already there. I'm lazy, i know.
# Spawn calcurses so I can know what the fuck I'm supposed to do of my time
