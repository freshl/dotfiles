autoload -Uz promptinit
promptinit

plugins=()

export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/zsh

export PATH="/usr/local/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
# export ANDROID_HOME=~/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools

# display how long all tasks over 10 seconds take
export REPORTTIME=10

[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/usr/share/terminfo

# define the code directory
# This is where my code exists and where I want the `c` autocomplete to work from exclusively
if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
fi

autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi

export PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"

# initialize autocomplete
autoload -U compinit
compinit

for config ($ZSH/**/*completion.sh) source $config

export EDITOR='nvim'

export PATH=/usr/local/bin:$PATH

# add /usr/local/sbin
if [[ -d /usr/local/sbin ]]; then
    export PATH=/usr/local/sbin:$PATH
fi

# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

# [ -z "$TMUX" ] && export TERM=xterm-256color

# install rbenv
if hash rbenv 2>/dev/null; then
    eval "$(rbenv init -)"
fi

# # alias git to hub
if hash hub 2>/dev/null; then
    eval "$(hub alias -s)"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
# source nvm
# export NVM_DIR=~/.nvm

# if hash brew 2>/dev/null; then
#     source $(brew --prefix nvm)/nvm.sh
#     source `brew --prefix`/etc/profile.d/z.sh
# fi


# Base16 Shell
# if [ -z "$THEME" ]; then
#     export THEME="base16-bright"
# fi
# if [ -z "$BACKGROUND" ]; then
#     export BACKGROUND="dark"
# fi

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export PATH="$PATH:`yarn global bin`"

# BASE16_SHELL="$DOTFILES/.config/base16-shell/$THEME.$BACKGROUND.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# source $BASE16_SHELL
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export ANDROID_HOME=/Users/$(whoami)/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

prompt pure
PROMPT='%(?.%F{red}.%F{yellow})❯%F{green}❯%F{blue}❯%f '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
