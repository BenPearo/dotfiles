# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' frequency 7

COMPLETION_WAITING_DOTS="true"

plugins=(git colored-man-pages colorize pip python brew macos zsh-autosuggestions fzf-zsh-plugin)

source $ZSH/oh-my-zsh.sh

# Aliases
alias build-branch="${HOME}/.local/bin/build-branch.sh"
alias build-branch-minimal="${HOME}/.local/bin/build-branch-minimal.sh"
alias build-supporting="${HOME}/.local/bin/docker-supporting.sh"
alias open-docker="open -a Docker"
alias close-docker="pkill -SIGHUP -f /Applications/Docker.app 'docker serve'"
alias vim="nvim"
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias doc='docker compose'
alias cat='bat'
alias logs='${HOME}/.local/bin/logs.sh'

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

# FZF exports
export FZF_DEFAULT_COMMAND="find . -type d \( -name .git -o -name node_modules \) -prune -o -print"

# TODO: What is this
# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benpearo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benpearo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
