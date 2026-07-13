# Zinit plugin manager
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# OMZ lib snippets — needed at startup for theme and shell behaviour
COMPLETION_WAITING_DOTS="true"
export ZSH_CACHE_DIR="${HOME}/.cache/zsh"
mkdir -p "$ZSH_CACHE_DIR"
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::termsupport.zsh

# Theme — eager so the first prompt renders correctly
zinit snippet OMZT::robbyrussell

# Plugins deferred until after first prompt
zinit ice wait lucid; zinit snippet OMZP::git
zinit ice wait lucid; zinit snippet OMZP::colored-man-pages
zinit ice wait lucid; zinit snippet OMZP::colorize
zinit ice wait lucid; zinit snippet OMZP::brew

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# fzf-tab — zicompinit runs compinit (cached with -C) then replays buffered compdef calls
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light Aloxaf/fzf-tab

# fzf key bindings: Ctrl+R history, Ctrl+T file picker, Alt+C dir jump
zinit ice wait lucid
zinit light unixorn/fzf-zsh-plugin

# Modular config files
for conf in "$HOME/.config/zsh/modules/"*.zsh; do source "${conf}"; done
unset conf

# PATH
export PATH="/usr/local/opt/node@10/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

export FZF_DEFAULT_COMMAND="find . -type d \( -name .git -o -name node_modules \) -prune -o -print"

# Google Cloud SDK
if [[ -f "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc" ]]; then
  source "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc"
fi
if [[ -f "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

eval "$(${HOME}/.local/bin/mise activate zsh)"
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
