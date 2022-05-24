# 参考: https://wiki.archlinux.jp/index.php/XDG_Base_Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

typeset -U path PATH manpath sudo_path
typeset -xT SUDO_PATH sudo_path

# zsh では変数 path と PATH は結び付けられている
# $path は配列、$PATH はコロン区切りの文字列
# 参考: https://unix.stackexchange.com/questions/532148/what-is-the-difference-between-path-and-path-lowercase-versus-uppercase-with
path=(
  $HOME/.bin(N-/)
  $HOME/bin(N-/)
  $HOME/.local/bin(N-/)
  $HOME/go/bin(N-/)
  $HOME/.go/bin(N-/)
  $HOME/.cargo/bin(N-/)
  $HOME/.yarn/bin(N-/)
  $HOME/.config/yarn/global/node_modules/.bin(N-/)
  /usr/local/go/bin(N-/)
  $path
)

# pager
export PAGER=less
export LESS='--no-init --quit-if-one-screen -R --LONG-PROMPT -i --shift 4 --jump-target=3'

# zip, unzip
export ZIPINFOOPT="-OCP932"
export UNZIPOPT="-OCP932"
