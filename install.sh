#!/bin/bash

rm -f ~/.dircolors
ln -sr dircolors ~/.dircolors

rm -f ~/.inputrc
ln -sr inputrc ~/.inputrc

rm -f ~/.tmux
ln -sr tmux ~/.tmux

rm -f ~/.vimrc
ln -sr vimrc ~/.vimrc

rm -f ~/.config/mc
ln -sr mc/config ~/.config/mc

rm -f ~/.local/share/mc/skins
ln -sr mc/skins ~/.local/share/mc/skins

mkdir -p ~/.vim-swap ~/.vim-undo ~/.vim-view

touch -a ~/.gitconfig
touch -a ~/.hushlogin

if [[ -z "$(git config --global --get --fixed-value include.path '~/dotfiles/gitconfig')" ]]; then
	git config --global --add include.path '~/dotfiles/gitconfig'
fi
