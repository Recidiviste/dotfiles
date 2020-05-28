# Profile file. Runs on login. Environmental variables are set here


# Defaults Programs
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="firefox"
export READER="zathura"
export NNN_LOCKER="bashlock"

# Path
export PATH=/home/luc/.local/share/cargo/bin:/home/luc/.local/share/go/bin:/home/luc/.local/bin:$PATH$( find $HOME/bin/ -type d -printf ":%p" )

# Useful directories
export WALLPAPER="/home/luc/Images/wallpapers"
export TORRENT_DIR="/home/luc/Téléchargements/Torrent"

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'

# NNN
export NNN_PLUG='p:preview-tabbed;P:preview-tui'

# Cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="/dev/null"
export PULSE_COOKIE="~/.cache/pulse-cookie"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
