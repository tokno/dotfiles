#!/bin/bash -e

dorfiles_root=`git rev-parse --show-toplevel 2> /dev/null`
cd $dorfiles_root

ln -sf vimrc ~/.vimrc
ln -sf gvimrc ~/.gvimrc
ln -sf zshrc ~/.zshrc
ln -sf zshenv ~/.zshenv

ln -sf tmux.conf ~/.tmux.conf
ln -sf gemrc ~/.gemrc
ln -sf tigrc ~/.tigrc

