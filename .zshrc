# Created by suleyk for 5.8
autoload -U colors && colors
#setopt PROMPT_SUBST
# set_prompt () {
#	PS1="["
#	PS1+="%B%{$fg[green]%}%n%b%{$reset_color%}"
#	PS1+="@"
#	PS1+="%{$fg[cyan]%}%M"
#	PS1+=" %B%{$fg[yellow]%}%~%b%{$reset_color%}"
	#if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
	#	PS1+=" ("
	#	PS1+="%{$fg[magenta]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
	#	PS1+=")"
	#fi
#	PS1+="]$ "
#}
#precmd_functions+=set_prompt
PS1="[%B%{$fg[green]%}%n%b%{$reset_color%}@%{$fg[cyan]%}%M %B%{$fg[yellow]%}%~%b%{$reset_color%}]$ "
alias ls='ls --color'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias clear='clear && screenfetch'
alias confi3='vim ~/.config/i3/config'
alias confpoly='vim ~/.config/polybar/config'
alias confzsh='vim ~/.zshrc'
alias confvim='vim ~/.vimrc' 
alias steamgames='cd $HOME/.local/share/Steam/steamapps/common'
alias xkill=~/scripts/xkill

# History in cache directory
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

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

screenfetch
