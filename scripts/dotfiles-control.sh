#/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'
BRED='\033[1;31m'
BGREEN='\033[1;32m'
BCYAN='\033[1;36m'
BWIHTE='\033[1;37m'
GIT_DIR=~/Build/Github/perso/dotfiles
WAL_DIR=~/Build/Github/perso/wallpapers

function update_repo {
	cd $GIT_DIR
	# Scripts
	cp ~/bin/all-walls ~/bin/backlight-control ~/bin/current-wal ~/bin/draw_term ~/bin/dunst-reload ~/bin/last-walls ~/bin/mpd-control ~/bin/opout ~/bin/powermenu ~/bin/random-wall ~/bin/regen-wall-list ~/bin/texclear ~/bin/volume-control ~/bin/wallpaper-name ~/bin/dotfiles-control.sh scripts/
	# Configs
		# BSPWM
		cp -r ~/.config/bspwm config/
		printf "Copied ${BRED}bspwm ${NC}config\n"
		cp -r ~/.config/dunst config/
		printf "Copied ${BRED}dunst ${NC}config\n"
		cp -r ~/.config/i3 config/
		printf "Copied ${BRED}i3 ${NC}config\n"
		rsync -a ~/.config/mpd config/ --exclude database --exclude log --exclude pid --exclude state --exclude sticker.sql
		printf "Copied ${BRED}mpd ${NC}config\n"
		cp -r ~/.config/mpv config/
		printf "Copied ${BRED}mpv ${NC}config\n"
		rsync -a ~/.config/ncmpcpp config/ --exclude lyrics --exclude error.log
		printf "Copied ${BRED}ncmpcpp ${NC}config\n"
		rsync -a ~/.config/nvim config/ --exclude autoload --exclude plugged --exclude spell
		printf "Copied ${BRED}nvim ${NC}config\n"
		rsync -a ~/.config/polybar config/ --exclude polybar-themes
		printf "Copied ${BRED}polybar ${NC}config\n"
		cp -r ~/.config/ranger config/
		printf "Copied ${BRED}ranger ${NC}config\n"
		cp -r ~/.config/rofi config/
		printf "Copied ${BRED}rofi ${NC}config\n"
		cp -r ~/.config/sxhkd config/
		printf "Copied ${BRED}sxhkd ${NC}config\n"
		cp -r ~/.config/termite config/
		printf "Copied ${BRED}termite ${NC}config\n"
		cp -r ~/.config/vifm config/
		printf "Copied ${BRED}vifm ${NC}config\n"
		cp -r ~/.config/zathura config/
		printf "Copied ${BRED}zathura ${NC}config\n"
		cp ~/.config/i3-scrot.conf config/
		printf "Copied ${BRED}i3-scrot ${NC}config\n"
		cp ~/.zshrc config/
		printf "Copied ${BRED} zsh ${NC}config\n"
		git add *
		read -p "Commmit ? [y/n]: " a
		if [[ $a =~ ^[Yy]$ ]] ; then git commit -m "Scripted Update"; fi
		read -p "Push ? [y/n]: " b
		if [[ $b =~ ^[Yy]$ ]] ; then git push origin master; fi
}

function update_pc {
	cd $GIT_DIR
	git pull
	rsync -av config/* ~/.config/ --exclude .zshrc
	mv config/.zshrc ~/.zshrc
	printf "Copied ${BRED}all configs ${NC}to PC"
}

function wals_changes {
	printf "${BLUE} 1${BWHITE} Import Wallpapers ${BGREEN}($(ls $WAL_DIR/wallpapers | wc -l) wals on git)
${BLUE} 2${BWHITE} Upload to Github ${BGREEN}($(ls $WALLPAPER | wc -l) wals on PC)${NC}\n"
	read -p "Choose: " choice
	case $choice in
		1) cd $WAL_DIR
			git pull
			rsync -av wallpapers/* $WALLPAPER
			printf "${BCYAN}Wallpapers Copied${NC}\n"
			;;
		2) cd $WALLPAPER
			rsync -av * $WAL_DIR/wallpapers --exclude .wall-list
			git add *
			read -p "Commit ? [y/n]: " c
			if [[ $c =~ ^[Yy]$ ]] ; then git commit -m "Scripted Update"; fi
			read -p "Push ? [y/n]: " d
			if [[ $d =~ ^[Yy]$ ]] ; then git push origine master; fi
			;;
	esac
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
	*) printf "${RED}!!${NC} Bad option ${RED}!!${NC}\n"
		false
esac
