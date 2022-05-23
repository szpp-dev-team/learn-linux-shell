#!/bin/bash
set -eu

if ! command -v zsh >/dev/null || ! command -v git >/dev/null || ! command -v curl >/dev/null ; then
  cat >&2 << EOT
zsh, git, curl がインストールされていません。
zsh, git, curl をインストールしてから、もう一度私を実行してください。

Ubuntu の場合の zsh のインストール方法:
    sudo apt install zsh git curl

EOT
  exit 1
fi

if [ -f "$HOME/.zshrc" ] || [ -f "$HOME/.zshenv" ]; then
  cat << EOT
  既に ~/.zshrc または ~/.zshev が存在します。
  このスクリプトは ~/.zshrc と ~/.zshenv を書き換えます。
  バックアップを作成して続行しますか？
EOT
  echo;
  read -rp "yes/no: " yn
  echo;
  case "$yn" in
    yes ) ;;
    no ) echo "インストールせず終了します。Good bye!"; exit 0;;
    * ) echo "yes または no を入力してください。" >&2; exit 1;;
  esac

  backup_dir="$HOME/Backup/zsh-config-$(date +%F)"
  mkdir -p "$backup_dir"
  echo -e "バックアップディレクトリ: ${backup_dir}\n"
  [ -f "$HOME/.zshenv" ] && cp -v "$HOME/.zshenv" "$backup_dir"
  [ -f "$HOME/.zshrc" ] && cp -v "$HOME/.zshrc" "$backup_dir"
  [ -e "$HOME/.config/zsh" ] && mkdir -p "$backup_dir/.config" && cp -rv "$HOME/.config/zsh" "$backup_dir/.config"
  [ -e "$HOME/.config/starship.toml" ] && cp "$HOME/.config/starship.toml" "$backup_dir/.config"

  echo -e "\n====> バックアップが完了しました。<====="
fi

cd "$(dirname "$0")"
cp ./.zshrc "$HOME/.zshrc"
cp ./.zshenv "$HOME/.zshenv"
rm -rf "$HOME/.config/zsh"
mkdir -p "$HOME/.config"
cp -r ./.config/zsh "$HOME/.config"
cp ./.config/starship.toml "$HOME/.config"

echo -e "\n====> 設定ファイルのインストールが完了しました。<====\n"
