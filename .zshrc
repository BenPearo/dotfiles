# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' frequency 7

COMPLETION_WAITING_DOTS="true"

plugins=(git colored-man-pages colorize pip python brew macos zsh-autosuggestions fzf-zsh-plugin fzf-tab)

source $ZSH/oh-my-zsh.sh

# Load seperated config files
for conf in "$HOME/.config/zsh/modules/"*.zsh; do
  source "${conf}"
done
unset conf

# TODO: What is this

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

eval "$(~/.local/bin/mise activate zsh)"
eval "$(zoxide init zsh)"

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/bpearo@venacorp.com/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# opt+delete = delete word backward (fixes behaviour inside terminal multiplexers)
bindkey '\e\x7f' backward-kill-word
