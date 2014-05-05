#!/bin/bash

BUNDLE_DIR="$HOME/.vim/bundle"
TMUX_SCRIPTS_DIR="$HOME/.tmux"
DROPBOX_DEV="$HOME/Dropbox/Development"
DOT_FILES="vimrc tmux.conf"

BASE_DIR=$(dirname $0)

[ -d "$BUNDLE_DIR" ] || mkdir -p $BUNDLE_DIR
[ -d "$BUNDLE_DIR/neobundle.vim" ] || git clone git://github.com/Shougo/neobundle.vim $BUNDLE_DIR/neobundle.vim

for f in $DOT_FILES; do
  [ -f $HOME/$f ] || ln -s $BASE_DIR/$f $HOME/.$f
done

[ -d "$TMUX_SCRIPTS_DIR" ] || mkdir -p $TMUX_SCRIPTS_DIR

[[ ":$PATH:" == *":$TMUX_SCRIPTS_DIR:"* ]] || export PATH=$PATH:$TMUX_SCRIPTS_DIR

for tmux_script_file in $(ls $DROPBOX_DEV/tmux/*.sh); do
  tmux_script_base_file=$(basename $tmux_script_file)
  [ -f $TMUX_SCRIPTS_DIR/$tmux_script_base_file ] || ln -s $tmux_script_file $TMUX_SCRIPTS_DIR/$tmux_script_base_file 
done

