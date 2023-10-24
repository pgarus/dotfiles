#!/bin/sh

ln -sfrT dircolors ~/.dircolors
ln -sfrT inputrc ~/.inputrc
ln -sfrT tmux ~/.tmux
ln -sfrT vimrc ~/.vimrc

ln -sfrT mc/config ~/.config/mc
ln -sfrT mc/skins ~/.local/share/mc/skins

mkdir -p ~/.vim-swap ~/.vim-undo ~/.vim-view

touch ~/.hushlogin
