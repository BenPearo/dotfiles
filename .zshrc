# Path to your oh-my-zsh installation.
export ZSH="/Users/benpearo/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' frequency 7

COMPLETION_WAITING_DOTS="true"

plugins=(git colored-man-pages colorize pip python brew macos zsh-autosuggestions fzf-zsh-plugin)

source $ZSH/oh-my-zsh.sh

# Aliases
alias build-branch="/Users/benpearo/.local/bin/build-branch.sh"
alias build-branch-minimal="/Users/benpearo/.local/bin/build-branch-minimal.sh"
alias build-supporting="/Users/benpearo/.local/bin/docker-supporting.sh"
alias open-docker="open -a Docker"
alias close-docker="pkill -SIGHUP -f /Applications/Docker.app 'docker serve'"
alias vim="nvim"
alias vi="nvim"
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias doc='docker compose'
alias cat='bat'

# Java versions
# export JAVA_HOME=/Users/benpearo/Library/Java/JavaVirtualMachines/openjdk-17.0.2/Contents/Home
export JAVA_HOME=/Users/benpearo/Library/Java/JavaVirtualMachines/corretto-1.8.0_302/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# TODO: What is this
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/opt/node@10/bin:$PATH"

# Android paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:./nvim-macos/bin/nvim

# TODO: What is this
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/benpearo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# nvm paths
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
