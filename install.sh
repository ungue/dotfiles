#!/bin/bash

BUNDLE_DIR="$HOME/.vim/bundle"
DROPBOX_DEV="$HOME/Dropbox/Development"
DOT_FILES="vimrc tmux.conf"

BASE_DIR=$(dirname $0)

[ -d "$BUNDLE_DIR" ] || mkdir -p $BUNDLE_DIR
[ -d "$BUNDLE_DIR/neobundle.vim" ] || git clone git://github.com/Shougo/neobundle.vim $BUNDLE_DIR/neobundle.vim

for f in $DOT_FILES; do
  [ -f $HOME/$f ] || ln -s $BASE_DIR/$f $HOME/.$f
done

[ "$(gem list tmuxinator -i)" == "true" ] || gem install tmuxinator

for yml_file in "$DROPBOX_DEV/tmuxinator/*.yml"; do
  yml_base_file=$(basename $yml_file)
  [ -f $HOME/.tmuxinator/$yml_base_file ] || ln -s $yml_file $HOME/.tmuxinator/$yml_base_file
done

rbenv rehash
