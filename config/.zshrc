# Welcome message
cat << EOF
No gods, no masters. Property is theft. Anarchy is order !
EOF

# Prompt
PS1='%F{red}%B┌─<%F{blue}%n %F{grey}@ %F{cyan}%M %F{grey}in %F{green}%3~%F{red}>
└─<>──%F{yellow}»%F%b '

# ZSH History
HISTFILE=~/.cache/zshistory
HISTSIZE=1000
SAVEHIST=1000

# ZSH Vi Mode
bindkey -v
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ZSH Vi indicator
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
       echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

# Up Arrow Completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "\e[H" beginning-of-line # Début
bindkey "\e[F" end-of-line # Fin
bindkey "\e[3~" delete-char
bindkey "^R" history-incremental-search-backward # Rechercher

# Environment variables
export PATH=$HOME/bin:$HOME/.cargo/bin:/home/luc/go/bin:/home/luc/.local/bin:/home/luc/.gem/ruby/2.7.0/bin:$PATH
export WALLPAPER=/home/luc/Images/wallpapers
export TORRENT_DIR=/home/luc/Téléchargements/Torrent/
export QT_QPA_PLATFORMTHEME=gtk2
export EDITOR=nvim
export TERMINAL=termite

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'

# Aliases
alias ls='ls --color $argv'
alias la='ls -lah --color $argv'
alias ll='ls -l'
alias lexa='exa -Tla'
alias allatex-comp='for file in $(ls | grep '.tex'); do xelatex $file; done; rm *.aux *.log'
alias open='xdg-open $argv'
alias manim='python3.7 ~/Build/Github/externals/manim/manim.py'
eval $(thefuck --alias)

# zsh-autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/completition.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

