#!/bin/bash
DOTFILES=~/dotfiles

echo "Installing some dotfiles :)"

echo "->> Checking for Homebrew"
# brew instsall neovim
# brew install the_silver_searcher

echo "->> Setting up Symlinks"

echo "->>> VIM"
ln -s $DOTFILES/vimrc ~/.vimrc

echo "->>> TMUX"
ln -s $DOTFILES/tmux/tmux.conf ~/.tmux.conf

echo "->> Symlinks FINISHED"
echo "Installation done! Have fun coding :)"
