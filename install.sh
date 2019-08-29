#!/bin/bash
DOTFILES=~/dotfiles

echo "Installing some dotfiles :)"

# Checking node installation, exit if missing
echo "->> Checking Node installation\n"
which asd
if [ $? -eq 0 ]; then
  echo "--> Awesome! Node is installed. Lets continue\n"
else
  printf "\x1B[31mNode not found. Please install Node before executing this script :)\e[0m \n"
    printf "\e[1mDownload NodeJS:\e[0"
    printf "\e[4mhttps://nodejs.org/en/download/current/\e[0m"
    exit 1;
  fi

## check home brew installation, install if missing
echo "->> Checking for Homebrew\n"
which -s brew
if [[ $? != 0 ]] ; then
		echo "->> Installing Homebrew\n"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
		echo "->> Updating Homebrew\n"
    brew update
fi

# Install brew packages
echo "->> Installing Packages\n"

echo "->> Installing FZF"
brew install fzf
echo "->> Installing neovim"
brew install neovim

echo "->> Setting up Symlinks\n"

# Symlink stuff
echo "->>> VIM"
ln -s $DOTFILES/vimrc ~/.vimrc

echo "Installation done! Have fun coding :)"
