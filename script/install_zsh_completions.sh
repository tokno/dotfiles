#!/bin/bash

if [ -e ~/.zsh/zsh-completions ]; then
    echo "zsh-completions already installed."
    exit
fi

git clone git://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions

