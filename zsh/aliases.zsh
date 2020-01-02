# reload zsh config
alias reload!='source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

alias vim="nvim"

# Set Git language to English
alias git='LANG=en_GB git'

# Git helper
# init completion
# Git branch bash completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  
  # Add git completion to aliases
  __git_complete gc _git_checkout
  __git_complete gf __git_fetch
  __git_complete gp _git_pull
  __git_complete gpo _git_pull_origin
  __git_complete gcom _git_commit
fi

alias gc='git checkout'
alias gf='git fetch'
alias gpo='git pull origin'
alias gcom='git commit'
alias gp='git pull'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Applications
alias ios='open -a /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

# code directories
alias code="cd ~/Documents/Coding/"
alias htdocs="cd /Applications/MAMP/htdocs"

# REAT NATIVE
alias rn_debug="cd android/ && ./gradlew clean && cd .. && react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res && cd android/ && ./gradlew assembleDebug"
