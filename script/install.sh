#!/bin/bash -e

dotfiles=`git rev-parse --show-toplevel 2> /dev/null`
cd $dotfiles

ln -sf $dotfiles/vimrc ~/.vimrc
ln -sf $dotfiles/gvimrc ~/.gvimrc
ln -sf $dotfiles/zshrc ~/.zshrc
ln -sf $dotfiles/zshenv ~/.zshenv

ln -sf $dotfiles/tmux.conf ~/.tmux.conf
ln -sf $dotfiles/gemrc ~/.gemrc
ln -sf $dotfiles/tigrc ~/.tigrc

