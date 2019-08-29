#!/bin/bash
DOTFILES=~/dotfiles

echo "******************************"
echo "Installing some dotfiles :)"
echo

## check for OhMyZSH
echo "->> Checking for ZSH"
echo
which -s zsh
if [[ $? != 0 ]] ; then
		echo "---> Installing ZSH"
    echo
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "---> Awesome! ZSH is already installed :)"
  echo
fi

## check home brew installation, install if missing
echo "->> Checking for Homebrew"
echo
which -s brew
if [[ $? != 0 ]] ; then
		echo "---> Installing Homebrew"
    echo
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
		echo "---> Updating Homebrew"
    echo
    brew update
fi

# Checking node installation, exit if missing
echo "->> Checking Node installation"
echo
which node
if [ $? -eq 0 ]; then
  echo "---> Awesome! Node is installed. Lets continue"
  echo
else
  echo "---> Installing Node..."
  brew install node
fi

# Install brew packages
echo "******************************"
echo "->> Checking Packages"
echo

which -s git
if [[ $? != 0 ]] ; then
		echo "---> Installing git"
    echo
    brew install git
else
    echo "---> Git found!"
    echo
fi

echo "******************************"
echo "->> Installing ReactNative dependencies"
echo

echo "---> Installing/Updating watchman"
echo
brew install watchman
echo "---> Installing/Updating JDK"
echo
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8

echo "---> Installing/Updating FZF"
echo
brew install fzf

echo "---> Installing/Updating neovim"
echo
brew install neovim


# check global node packages
echo "******************************"
echo "->> Checking NPM Packages"
echo

echo "---> Installing/Updating Prettier..."
echo
npm install -g prettier

echo "---> Installing/Updating ReactNative CLI..."
echo
npm install -g react-native-cli

echo "---> Installing/Updating CRA..."
echo
npm install -g create-react-app


echo "******************************"
echo "->> Setting up Symlinks"
echo 

# Symlink stuff
echo "---> Linking: vimrc"
echo
ln -s $DOTFILES/vimrc ~/.vimrc
echo "---> Linking: zshrc"
echo
ln -s $DOTFILES/zshrc ~/.zshrc

echo "******************************"
echo "->> Installing ZSH Addons"
echo 

echo "---> Installing ZSH Autosuggest"
echo
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installation done, dont forget to restart your terminal! Have fun coding :)"
