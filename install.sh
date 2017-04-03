#!/bin/sh
#P=$PWD/$0
ln -s ~/dotfiles/.vimrc ~/.vimrc 
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

cd ~/dotfiles/.vim/
git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
git clone git://github.com/tpope/vim-vinegar.git bundle/vim-vinegar.git
