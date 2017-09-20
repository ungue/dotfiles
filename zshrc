# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

PATH=$HOME/.rbenv/bin:$HOME/.ndenv/bin:$PATH

[[ -s "$HOME/.zshrc-private" ]] && source $HOME/.zshrc-private

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws extract rails git ruby vi-mode gem autojump bundler docker-compose frontend-search web-search tmux)

source $ZSH/oh-my-zsh.sh

autoload zmv

export PATH=$HOME/.tmux:$PATH

export EDITOR=vim

[[ -s "$HOME/.zshrc-aliases" ]] && source $HOME/.zshrc-aliases

# Ctrl+R history search
bindkey '^R' history-incremental-search-backward
# Ctrl+F forward history search
bindkey '^F' history-incremental-search-forward

eval "$(rbenv init -)"
eval "$(ndenv init -)"

[[ -f "$HOME/.dircolors" ]] && eval "$(dircolors $HOME/.dircolors)"

setopt extended_glob
