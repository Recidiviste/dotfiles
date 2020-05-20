# Welcome message
cat << EOF
No gods, no masters. Property is theft. Anarchy is order !
EOF

autoload -U colors && colors
# Prompt
PS1="%B%{$fg[red]┌─<%}%{$fg[blue]%}%n%{$fg[magenta]%}@%{$fg[cyan]%}%M %{$fg[magenta]%}in %{$fg[green]%}%~%{$fg[red]%}>
└─<>──%{$fg[yellow]%}»%b "

# ZSH History
HISTFILE=~/.cache/zshistory
HISTSIZE=10000
SAVEHIST=10000

# Load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -a "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

export KEYTIMEOUT=1

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

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
