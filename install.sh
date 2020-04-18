#! /bin/sh

set -ex

git submodule init
git submodule update

stow emacs
stow --no-folding emacsclient
stow i3
stow tmux
stow vim
stow zsh
stow --no-folding x11

stow --no-folding fonts
fc-cache -v -f
