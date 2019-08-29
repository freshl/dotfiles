#!/bin/bash
DOTFILES=~/dotfiles

echo "Installing some dotfiles :)"

echo "->> Checking for Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
		echo "->> Installing Homebrew"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
		echo "->> Updating Homebrew"
    brew update
fi


echo "->> Installing Packages"

echo "->> Installing FZF"
brew install fzf
echo "->> Installung neovim"
brew install neovim

echo "->> Setting up Symlinks"

echo "->>> VIM"
ln -s $DOTFILES/vimrc ~/.vimrc

# echo "->>> TMUX"
# ln -s $DOTFILES/tmux/tmux.conf ~/.tmux.conf

echo "->> Symlinks FINISHED"
echo "Installation done! Have fun coding :)"
