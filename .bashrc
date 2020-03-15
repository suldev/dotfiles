#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias cls='clear && screenfetch'
PS1="[\e[1;32m\u\e[m@\e[0;36m\H \e[1;33m\w\e[m]\$ "

# Run initial commands here
screenfetch
