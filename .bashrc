#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[[ -f "${HOME}/.bash_profile" ]] && . "${HOME}/.bash_profile"

# Load bash files
[[ -f "${HOME}/.bash_aliases" ]] && . "${HOME}/.bash_aliases"

function parse_git_dirty {
    [[ -n "$(git status -s 2> /dev/null)" ]] && echo -e '\033[1;31m'
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ $(parse_git_dirty)(\1)/"
}

PS1="\[\033[01;36m\]\u : \h\[\033[00m\] / \[\033[01;34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# set maven to system PATH
export PATH=$PATH:/opt/maven/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/clistoq/.sdkman"
[[ -s "/home/clistoq/.sdkman/bin/sdkman-init.sh" ]] && source "/home/clistoq/.sdkman/bin/sdkman-init.sh"
