#!/bin/bash

dotfiles_directory=$(dirname "$0")

pushd "$dotfiles_directory" > /dev/null

rm -f ~/.dircolors
ln -sr dircolors ~/.dircolors

rm -f ~/.inputrc
ln -sr inputrc ~/.inputrc

rm -f ~/.tmux
ln -sr tmux ~/.tmux

rm -f ~/.vimrc
ln -sr vimrc ~/.vimrc

mkdir -p ~/.config
rm -f ~/.config/mc
ln -sr mc/config ~/.config/mc

mkdir -p ~/.local/share/mc
rm -f ~/.local/share/mc/skins
ln -sr mc/skins ~/.local/share/mc/skins

mkdir -p ~/.vim-swap ~/.vim-undo ~/.vim-view

touch -a ~/.gitconfig
touch -a ~/.hushlogin

if [[ -z "$(git config --global --get include.path '^~/dotfiles/gitconfig$')" ]]; then
	git config --global --add include.path '~/dotfiles/gitconfig'
fi

grep -qxF 'source ~/dotfiles/fzfrc' ~/.profile || echo 'source ~/dotfiles/fzfrc' >> ~/.profile

popd > /dev/null
