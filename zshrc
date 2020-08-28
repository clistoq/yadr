# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/clistoq/.oh-my-zsh"

set -o vi

autoload -Uz compinit; compinit

# Set browser for URLs from terminal
export BROWSER=firefox

# Set path variables for individually compiled software
# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Bazel
export PATH=/home/rootnode/programs/src/bazel/output:$PATH

# Wrk
export PATH=/opt/wrk/bin:$PATH
export WRK_HOME=/opt/wrk

# FZF
export FZF_BASE="$HOME/.fzf"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/clistoq/.sdkman"
[[ -s "/home/clistoq/.sdkman/bin/sdkman-init.sh" ]] && source "/home/clistoq/.sdkman/bin/sdkman-init.sh"

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

  colored-man-pages
  
  docker
  docker-compose

  fzf

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
  
  z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

export COLORTERM=rxvt-unicode-256color

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
