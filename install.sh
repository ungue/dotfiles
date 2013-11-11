#!/bin/bash

BUNDLE_DIR="$HOME/.vim/bundle"
DOT_FILES="vimrc tmux.conf"

BASE_DIR=$(dirname $0)

[ -d "$BUNDLE_DIR" ] || mkdir -p $BUNDLE_DIR
[ -d "$BUNDLE_DIR/neobundle.vim" ] || git clone git://github.com/Shougo/neobundle.vim $BUNDLE_DIR/neobundle.vim

for f in $DOT_FILES; do
  [ -f $HOME/$f ] || ln -s $BASE_DIR/$f $HOME/.$f
done
