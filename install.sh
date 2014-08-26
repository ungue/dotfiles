#!/bin/bash

BUNDLE_DIR="$HOME/.vim/bundle"
TMUX_SCRIPTS_DIR="$HOME/.tmux"
DROPBOX_DEV="$HOME/Dropbox/Development"
DOT_FILES="vimrc tmux.conf tmux-osx.conf tmux-linux.conf zshrc zshrc-aliases"
SO="linux"

if [ "$(uname)" = "Darwin" ]; then
  SO="osx"
fi

BASE_DIR=$(cd "$(dirname $0)"; pwd -P)
echo $BASE_DIR

# SSH files
[ -d "$HOME/.ssh" ]        || mkdir -p $HOME/.ssh
[ -d "$HOME/.ssh/keys" ]   || ln -s $DROPBOX_DEV/ssh/keys $HOME/.ssh/keys
[ -f "$HOME/.ssh/config" ] || ln -s $DROPBOX_DEV/ssh/config $HOME/.ssh/config

# Vim bundles
[ -d "$BUNDLE_DIR" ] || mkdir -p $BUNDLE_DIR
[ -d "$BUNDLE_DIR/neobundle.vim" ] || git clone git://github.com/Shougo/neobundle.vim $BUNDLE_DIR/neobundle.vim

# Link dot files
for f in $DOT_FILES; do
  [ -f $HOME/$f ] || ln -s $BASE_DIR/$f $HOME/.$f
done

# tmux related files
[ -d "$TMUX_SCRIPTS_DIR" ] || mkdir -p $TMUX_SCRIPTS_DIR

for tmux_script_file in $(ls $DROPBOX_DEV/tmux/*.sh); do
  tmux_script_base_file=$(basename $tmux_script_file)
  [ -f $TMUX_SCRIPTS_DIR/$tmux_script_base_file ] || ln -s $tmux_script_file $TMUX_SCRIPTS_DIR/$tmux_script_base_file 
done

# Zsh stuff
[ -f $HOME/.zshrc-private ] || ln -s $DROPBOX_DEV/zsh/zshrc-private-$SO $HOME/.zshrc-private

# Install some packages
if [ $SO = "osx" ]; then
  brew install the_silver_searcher
  brew install reattach-to-user-namespace
else
  sudo apt-get install silversearcher-ag 
fi
