#!/bin/bash


##########
# Basics #
##########

systemctl --user import-environment DISPLAY # To permit to dunst to work
setxkbmap -layout fr # Put the keyboard in azerty
xsetroot -cursor_name left_ptr # Basic cursor and not a cross
sxhkd & # Start Simple Hotkey Daemon
# deadd-notification-center & # Notification daemon


#########################
# Programs to autostart #
#########################

$HOME/.config/polybar/launch.sh & # Polybar
picom -fb --dbus & # Compton
xmodmap $HOME/.Xmodmap # Custom keyboard mappings
# $HOME/bin/random-wall # Random wallpaper
$HOME/.fehbg # Restore last wallpaper
$HOME/bin/regen-wall-list # Recreate wall list
xautolock -locker "i3lock-fancy" -time 15 & # Autolock
discord &

###########
# Applets #
###########

nm-applet & # Network Manager
copyq & # CopyQ
