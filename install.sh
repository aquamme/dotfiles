#! /bin/sh

git submodule init
git submodule update

stow emacs
stow --no-folding emacsclient
stow i3
stow tmux
stow vim
stow x11
