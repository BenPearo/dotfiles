# Git aliases
alias gco="git checkout"
alias gnb="git checkout -b"
alias gcm="git commit -m"
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Tmux
alias tmk="tmux kill-session"
alias stmux="tmux source ~/.config/tmux/tmux.conf"
alias tmd="tmux detach"

# Remap tools
alias open-docker="open -a Docker"
alias close-docker="pkill -SIGHUP -f /Applications/Docker.app 'docker serve'"
alias vim="nvim"
alias cat='bat'
alias doc='docker compose'
alias ssketchy='brew services start sketchybar'
alias stsketchy='brew services stop sketchybar'

# Pure convenience
alias local-test='. /Users/bpearo@venacorp.com/.local/bin/local-test.sh'
alias rtx="mise"
