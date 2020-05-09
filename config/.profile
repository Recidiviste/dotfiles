# Profile file. Runs on login. Environmental variables are set here


# Defaults Programs
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="firefox"
export READER="zathura"
export NNN_LOCKER="bashlock"

# Path
export PATH=/home/luc/go/bin:/home/luc/.local/bin:$PATH$( find $HOME/bin/ -type d -printf ":%p" )

# Useful directories
export WALLPAPER="/home/luc/Images/wallpapers"
export TORRENT_DIR="/home/luc/Téléchargements/Torrent"

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'

# Others
export QT_QPA_PLATFORMTHEME="gtk2"
