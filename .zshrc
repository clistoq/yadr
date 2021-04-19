export PATH=$HOME/bin:/usr/local/bin:$PATH

set -o vi
setopt autocd              # change directory just by typing its name
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Turn on autocompletion for all commands and its switches
# and also autocompletion in privileged mode.
autoload -Uz compinit, bashcompinit
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# Set browser for URLs from terminal
export BROWSER=waterfox

# Set path variables for individually compiled software
# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Bazel
export PATH=/home/rootnode/programs/src/bazel/output:$PATH

# Wrk
WRK_HOME=/opt/wrk
export PATH=$WRK_HOME/bin:$PATH

# Yarn modules
YARN=$HOME/.yarn/bin
export PATH=$YARN:$PATH

# Programs installed in /opt/installed
export PATH=/opt/installed:$PATH

# FZF
export FZF_BASE="$HOME/.fzf"

# Krew plugin manager for Kubernetes
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
if [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]]; then source "${HOME}/.sdkman/bin/sdkman-init.sh"; fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  archlinux

  aws

  colored-man-pages

  docker
  docker-compose

  fzf

  gcloud

  git
  git-flow
  git-extras
  gitignore

  golang

  gradle

  helm

  kops
  kubectl

  mvn

  oc

  rsync

  z
)

source $ZSH/oh-my-zsh.sh

[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

export CLICOLOR=1

# Go environment variables
GOPATH=$HOME/go/src
GOBIN=$HOME/go/bin

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l='ls -al'
alias tmux="tmux -f ${HOME}/.config/tmux/tmux.conf"
alias vim='nvim'

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

raw-name() {
    echo "$*" | cut -d '.' --complement -f2-
}

# Convert a markdown file to manpage format and pipe it to stdout
mdcat() {
    grep -v "\-\-\-\-\-" "$*" | pandoc -s -f markdown -t man | groff -T utf8 -man
}

# Convert a markdown file to manpage and read it with less
mdless() {
    mdcat "$*" | less
}

# Convert a markdown file to html and view it inside the terminal with w3m
mdweb() {
    grep -v "\-\-\-\-\-" "$*" | pandoc -s -f markdown -t html --webtex=http://chart.apis.google.com/chart\?cht\=tx\&chf\=bg,s,151515\&chco=ffffff\&chl\= --toc | w3m -T text/html
}

md-create-pdf() {
    grep -v "\-\-\-\-\-" "$*" | pandoc --listings --toc -o `(raw-name "$*")`.pdf
}

md-create-pdf-with-template() {
    grep -v "\-\-\-\-\-" "$*" | pandoc --listings --latex-engine=xelatex --template=latex.template --toc -o `(raw-name "$*")`.pdf
}

md-create-html-slides() {
    pandoc --self-contained --webtex -t dzslides "$*" -o `(raw-name "$*")`.html
}

md-create-pdf-slides() {
    pandoc -t beamer -V theme:Rochester "$*" -o `(raw-name "$*")`_slides.pdf
}

if [ -f '~/.fzf.zsh' ]; then source '~/.fzf.zsh'; fi

# Azure completion script
if [ -f '/usr/local/share/applications/azure-cli/az.completion' ]; then source '/usr/local/share/applications/azure-cli/az.completion'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/opt/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
