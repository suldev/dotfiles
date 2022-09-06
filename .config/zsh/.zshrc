# Created by suleyk for 5.8
autoload -U colors && colors
autoload -Uz vcs_info
#source ~/.config/zsh/zsh-git-prompt/zshrc.sh
#PROMPT='%B%m%~%b$(git_super_status) %# '
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '('%{$fg[green]%}%B'%b'%{$reset_color%}')'
setopt prompt_subst
PROMPT='%B%{$fg[green]%}%n%b%{$reset_color%}@%{$fg[cyan]%}%M %B%{$fg[yellow]%}%~%b$ '
RPROMPT='${vcs_info_msg_0_}'
alias ls='ls -lA --color'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias clear='clear && neofetch'
alias steamgames='cd $HOME/.local/share/Steam/steamapps/common'
alias xkill=~/scripts/xkill
alias lsblk='lsblk --output NAME,RM,FSUSED,SIZE,FSUSE%,RO,TYPE,MOUNTPOINT'

alias confi3='vim $XDG_CONFIG_HOME/i3/config'
alias confpoly='vim $XDG_CONFIG_HOME/polybar/config'
alias confzsh='vim $XDG_CONFIG_HOME/zsh/.zshrc'
alias confvim='vim $XDG_CONFIG_HOME/vim/vimrc' 
alias confneo='vim $XDG_CONFIG_HOME/neofetch/config.conf'
alias confmutt='vim $XDG_CONFIG_HOME/neomutt/muttrc'

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vim mode
bindkey -v
export KEYTIMEOUT=1

# vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Change vim cursor shape
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
   echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} == '' ]] ||
       [[ $1 == 'beam' ]]; then
   echo -ne '\e[3 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
  zle -K viins
  echo -ne '\e[3 q'
}
zle -N zle-line-init
echo -ne '\e[3 q'
preexec() {echo -ne '\e[3 q' ;}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

rcd() {
   tmp="$(mktemp)"
   ranger --show-only-dirs --choosedir="$tmp" "$@"
   if [ -f "$tmp" ]; then
      dir="$(cat "$tmp")"
      rm -f "$tmp"
      [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
   fi
}

chpwd() ls --color
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

bindkey -s '^o' 'rcd\n'

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source /usr/share/nvm/init-nvm.sh

#update .vimrc file pointer
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

neofetch
