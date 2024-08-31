# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
COMPLETION_WAITING_DOTS="true"

unsetopt AUTO_CD

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
  aws
  ansible
  brew
  docker
  gcloud
  git
  gitignore
  git-flow
  gpg-agent
  golang
  fzf
  helm
  keychain
  kubectl
  kubectx
  kube-ps1
  macos
  rust
  ssh-agent
  terraform
  terragrunt
)

# Configuration for ssh-agent plugin
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 1h
zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="${HOME}/.jenv/bin:${HOME}/bin:/usr/local/bin:${HOME}/.krew/bin:${HOME}/.pub-cache/bin:/opt/homebrew/sbin:/opt/homebrew/bin:${PATH}"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export LANG=en_US.UTF-8

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which brave-browser`

alias waterfox="/Applications/Waterfox.app/Contents/MacOS/waterfox"

eval "$(jenv init -)"
eval "$(starship init zsh)"

# Created by `pipx` on 2024-07-30 21:31:20
export PATH="$PATH:/Users/dawidbutrykowski/.local/bin"
