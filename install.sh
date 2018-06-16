#!/bin/sh

ln -s ~/dotfiles/.vimrc ~/.vimrc 
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.config/i3/config ~/.config/i3/config

cd ~/dotfiles/.vim/
git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
git clone git://github.com/tpope/vim-vinegar.git bundle/vim-vinegar.git
git clone https://github.com/neomake/neomake.git bundle/neomake.git

