#!/bin/bash
DOTFILES=~/dotfiles

echo "Installing some dotfiles :)"

echo "->> Setting up Symlinks"

echo "->>> VIM"
ln -s $DOTFILES/vimrc ~/.vimrc

echo "->>> TMUX"
ln -s $DOTFILES/tmux/tmux.conf ~/.tmux.conf

echo "->> Symlinks FINISHED"
echo "Installation done! Have fun coding :)"
