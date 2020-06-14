# Scripts

Here is all the scripts I made or took. Each are explained (use and how it works). Because the one I took from other persons are still modified versions, I'll just say where to get them : 
* [Mendess spell-book](https://github.com/mendess/spell-book)
* [Luke Smith bin](https://github.com/LukeSmithxyz/voidrice)

**!!WARNING!!** All the scripts stole are pretty good. However, most of the scripts I wrote are bad (don't even think about shellcheck, this word is banned here). So, if you still want to use them, please read what's written below and try to write a better version of it.


### allgst
* Type : `sh`
* Dependencies : `git`

[allgst](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/allgst) is a script that iterates through directories, except surf dir (it's not a repo, just the version I got from Suckless Foundation), test if there's a directory named `.git`, fetch the recent updates if there is and print the name of the dir (in green) followed by the number of commits to pull. If there's no updates, print `Up to date`.


### ansi_colors
* Type : `python`
* Dependencies : `python`

[ansi_colors](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/ansi_colors) is a short python script that prints the importants escape codes (colors and other things) with there explainations


### backlight-control
* Type : `bash`
* Dependencies : `dunst`, `xorg-xbacklight`

[backlight-control](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/backlight-control) is a script used by sxhkd to change the screen light level and send a notification


### bashlock
* Type : `bash`
* Dependencies : `expect`

[bashlock](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/bashlock) is a script used in `nnn` to lock the terminal. After 5 retry, sleep.


### battery
* Type : `sh`
* Dependencies : None

[battery](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/battery) is a script that print the porcentage of battery with a logo.


### booksplit
* Type : `sh`
* Dependencies : `ffmpeg`, `tag` script

[booksplit](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/booksplit) is a script I took from Luke Smith. See [this video](https://www.youtube.com/watch?v=z_CcQhbwINU)


### cheet
* Type : `bash`
* Dependencies : `fzf`, `libnotify`

[cheet](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/cheet) is a very useful script, that, when launched, start fzf with all the (entered) keybindings for each applications


### compiler
* Type : `sh`
* Dependencies : None
* Optional Dependencies : `groff`, `R`, `pandoc`, `python`, `go`, `sent`

From Luke Smith, [compiler](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/compiler) is a script that autodetects the extension of the file passed as an argument, and compile it wiht the right tool


### current-wall
* Type : `bash`
* Dependencies : `dunst`

[current-wall](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/current-wal) is a simple script that retreive the wallpaper I'm using from the .fehbg file generated while setting the wallpaper. When retreived, it uses pywal with that wal.


### dmenuhidden
* Type : `bash`
* Dependencies : `bspwm`, `dmenu`

[dmenuhidden](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/dmenuhidden) is a menu for unhidding windows. That's simple.


### dmenuunicode
* Type : `sh`
* Dependencies : `xclip`, `libnotify`

Stolen from Luke Smith, [dmenuunicode](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/dmenuunicode) is a menu for selecting unicode characters (like emojis).


### dotfiles-control
* Type : `bash`
* Dependencies : `rsync`, `git`

[dotfiles-control](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/dotfiles-control) is still a work in progress. It aims to be a script to sync my wallpapers and my config with what's on my repos.


### draw_term
* Type : `bash`
* Dependencies : `bspwm`, `st`, `slop`

[draw_term](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/draw_term) is a little script for drawing (the box) a terminal.


### dunst-reload
* Type : `bash`
* Dependencies : `dunst`, `libnotify`

[dunst-reload](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/dunst-reload) is a script to restart dunst and test every urgency level.


### fontpreview
* Type : `bash`
* Dependencies : `imagemagick`, `xdotool`, `fzf`, `sxiv`

[fontpreview](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/fontpreview) is a very cool script that lets you browse through the available fonts and preview them.


### perscrot
* Type : `bash`
* Dependencies : `shotgun`, `xclip`, `dmenu`, `libnotify`

[perscrot](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/perscrot) is a useful script that lets you choose if you want to take a screenshot of a window/zone or of the full screen, and if you want to store it into your clipboard or in your directory for screenshots.


### powermenu
* Type : `bash`
* Dependencies : `lock.sh` script, `bspwm` (made for it but changeable)

[powermenu](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/powermenu) is a menu for locking, exiting, rebooting and shuting down the computer


### random-wall
* Type : `bash`
* Dependencies : `feh`

[random-wall](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/random-wall), as the name tells it, set a random wallpaper from the directory containing them.


### sxivr
* Type : `sh`
* Dependencies : `sxiv`

[sxivr](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/sxivr) is a script that iterates through a directory to open every file (plus the file selected). For short, shen opening a file with this script, you have all the others files loaded into `sxiv`.


### tag
* Type : `sh`
* Dependencies : `opustags`, `vorbis-tools`

[tag](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/tag) is another script from Luke Smith. It's used in [booksplit](#booksplit) to write metadata to each audio piece.


### texclear
* Type : `sh`
* Dependencies : None

[texclear](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/texclear) is another script stole from Luke Smith. It test if the passed file is a tex file, and then clear all the others file generated while compiling it.


### toggle-screenkey
* Type : `bash`
* Dependencies : `screenkey`

This script, as the name [toggle-screenkey](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/toggle-screenkey) tells it, toggle screenkey. It test if an instance is running, and kills it. If not, it starts screenkey


### volume-control
* Type : `bash`
* Dependencies : `amixer`, `dunst`

[volume-control](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/volume-control) is another little script used by sxhkd to change the volume and notify me.


### walc
* Type : `sh`
* Dependencies : `sxiv`, `feh`, `dmenu`

Originally taken from [Walld=-d](https://github.com/ronniedroid/Wall-d), I rewrote it to make [walc](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/waln). It's a script that, when launched, start sxiv with all my wallpapers, let me mark some (only take the last one), prompt for the way of setting it, and set it as my allpaper.


### waln
* Type : `bash`
* Dependencies : None

Simple script, [waln](https://github.com/Recidiviste/dotfiles/blob/master/.local/bin/waln) retreive the wallpaper name I'm using.
