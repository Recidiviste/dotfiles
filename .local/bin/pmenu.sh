#!/bin/sh

icons="/home/luc/.local/share/pmenu"

cat <<EOF | pmenu | sh &
Internet
	IMG:$icons/firefox.png		firefox
	IMG:$icons/qute.png		qutebrowser
	IMG:$icons/surf.png		surf /home/luc/repos/perso/startpage/index.html
	IMG:$icons/newsboat.png		termite -e newsboat
	IMG:$icons/neomutt.png		termite -e neomutt
Work
	IMG:$icons/calcurse.png		calcurse
	IMG:$icons/latex.png		termite -d ~/work/LaTeX
	IMG:$icons/python.png		termite -d ~/work/Python
	Cours				termite -d ~/work/Cours
	Exo				termite -d ~/work/Exo
Code
	C				termite -d ~/Documents/Code/C
	C++				termite -d ~/Documents/Code/C++
	LaTeX				termite -d ~/Documents/Code/LaTeX
	Python				termite -d ~/Documents/Code/Python
	Projects			zathura
	bin				termite -d ~/.local/bin
scripts
	Hiddens				dmenuhidden
	Emojis				dmenuunicode
	Games				games.sh
	Reddit				reddit
	Lock				lock.sh
EOF
