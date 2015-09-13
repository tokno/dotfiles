#!/bin/bash

if [ -e ~/.vim/bundle/neobundle.vim ]; then
    echo "Neobundle already installed."
    exit
fi

mkdir -p ~/.vim/bundle/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

