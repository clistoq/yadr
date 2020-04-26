#
# ~/.bash_profile
#

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

[[ -f /usr/share/fzf/key-bindings.bash ]] && . /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && . /usr/share/fzf/completion.bash
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Kubectl bash completion
[[ -f ~/.kube/completion.bash.inc ]] && . ~/.kube/completion.bash.inc

# Kind bash completion
[[ -f ~/.kube/kind.completion.bash.inc ]] && . ~/.kube/kind.completion.bash.inc

# Minikube bash completion
[[ -f ~/.minikube/completion.bash.inc ]] && . ~/.minikube/completion.bash.inc

# Openshift bash completion
[[ -f "${HOME}"/.oc/bash-completion.inc ]] && . "${HOME}"/.oc/bash-completion.inc

# Kube script which showing which namespace and which context is actual in use
[[ -f ~/.config/kube-ps1.sh ]] && . ~/.config/kube-ps1.sh 

# Kube script which showing which namespace and which context is actual in use
[[ -f ~/.config/git-prompt.sh ]] && . ~/.config/git-prompt.sh 

export KUBE_PS1_BINARY="oc"
export KUBE_PS1_SEPARATOR=' '
export KUBE_PS1_PREFIX=''
export KUBE_PS1_SUFFIX=''
export KUBE_PS1_SYMBOL_COLOR='green'
export KUBE_PS1_CTX_COLOR='cyan'
export KUBE_PS1_NS_COLOR='cyan'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose name"

export PS1='\[\033[01;36m\]\u : \h\[\033[00m\] / \[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)") / $(kube_ps1)\n\$ '

# export credentials for gcloud sdk tool
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/gcloud_auth.json"

export PATH="$HOME/.cargo/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/clistoq/.sdkman"
[[ -s "/home/clistoq/.sdkman/bin/sdkman-init.sh" ]] && source "/home/clistoq/.sdkman/bin/sdkman-init.sh"

# GO env PATH
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
