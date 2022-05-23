function safe_source() {
  [[ -f "$1" ]] && source "$1"
}

safe_source $HOME/.config/zsh/base.zsh
safe_source $HOME/.config/zsh/completion.zsh
safe_source $HOME/.config/zsh/alias.zsh
safe_source $HOME/.config/zsh/bindkey.zsh
safe_source $HOME/.config/zsh/plugins.zsh
