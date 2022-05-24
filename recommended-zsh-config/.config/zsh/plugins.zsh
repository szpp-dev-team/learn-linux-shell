# zsh のプラグイン (プラグインマネージャとして zinit を使用)
# https://github.com/zdharma-continuum/zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# コマンドラインの色付け
zinit light zdharma/fast-syntax-highlighting

# コマンドラインに入力されている文字列をもとに薄い色でコマンドを提案
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
zinit light zsh-users/zsh-autosuggestions

# 補完強化, z コマンド, ヒストリ検索の強化
zinit atinit'zpcompinit' lucid light-mode for \
  zsh-users/zsh-completions \
  agkozak/zsh-z \
  zsh-users/zsh-history-substring-search

# Starship プロンプト https://starship.rs/ja-jp/
if ! command -v starship >/dev/null ; then
  curl -sS https://starship.rs/install.sh | sh
fi
eval "$(starship init zsh)"
