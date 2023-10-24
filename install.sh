#!/bin/sh -e

rm -r ~/.dircolors
ln -sr dircolors ~/.dircolors

rm -r ~/.inputrc
ln -sr inputrc ~/.inputrc

rm -r ~/.tmux
ln -sr tmux ~/.tmux

rm ~/.vimrc
ln -sr vimrc ~/.vimrc

rm ~/.config/mc
ln -sr mc/config ~/.config/mc

rm ~/.local/share/mc/skins
ln -sr mc/skins ~/.local/share/mc/skins

mkdir -p ~/.vim-swap ~/.vim-undo ~/.vim-view

touch ~/.hushlogin
