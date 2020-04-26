#
# ~/.bashrc
#

# set primary system EDITOR
export EDITOR="vim"

[[ $- != *i* ]] && return

[[ -f "$HOME"/.bash_profile ]] && . "$HOME"/.bash_profile
[[ -f "$HOME"/.bash_aliases ]] && . "$HOME"/.bash_aliases

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

