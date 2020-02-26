#/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

function update_repo {
	cd ~/Build/Github/perso/dotfiles
	# Scripts
	cp ~/bin/all-walls ~/bin/backlight-control ~/bin/current-wal ~/bin/draw_term ~/bin/dunst-reload ~/bin/last-walls ~/bin/mpd-control ~/bin/opout ~/bin/powermenu ~/bin/random-wall ~/bin/regen-wall-list ~/bin/texclear ~/bin/volume-control ~/bin/wallpaper-name ~/bin/dotfiles-control.sh scripts/
	# Configs
		# BSPWM
		cp -r ~/.config/bspwm config/
		cp -r ~/.config/dunst config/
		cp -r ~/.config/i3 config/
		cp -r ~/.config/mpd config/
		cp -r ~/.config/mpv config/
		rsync -av ~/.config/ncmpcpp config/ --exclude lyrics --exclude error.log
		rsync -av ~/.config/nvim config/ --exclude autoload --exclude plugged --exclude spell
		rsync -av ~/.config/polybar config/ --exclude polybar-themes
		cp -r ~/.config/ranger config/
		cp -r ~/.config/rofi config/
		cp -r ~/.config/sxhkd config/
		cp -r ~/.config/termite config/
		cp -r ~/.config/vifm config/
		cp -r ~/.config/zathura config/
		cp ~/.config/i3-scrot.conf config/
		cp ~/.zshrc config/
		git add *
		read -p "Commmit ? [y/n]: " a
		if [[ $a =~ ^[Yy]$ ]] ; then git commit -m "Scripted Update"; fi
		read -p "Push ? [y/n]: " b
		if [[ $b =~ ^[Yy]$ ]] ; then git push origin master; fi
}

printf "${RED}+${GREEN}--------------------------${RED}+
${GREEN}|  ${BLUE}1 · ${NC}Upload to Github    ${GREEN}|
${GREEN}|  ${BLUE}2 · ${NC}Import configs      ${GREEN}|
${GREEN}|  ${BLUE}3 · ${NC}Wallpapers Changes  ${GREEN}|
${RED}+${GREEN}--------------------------${RED}+${NC}\n"
read -p "Choose: " dec

case $dec in
	1) update_repo
		;;
	2) update_pc
		;;
	3) wals_changes
		;;
esac
