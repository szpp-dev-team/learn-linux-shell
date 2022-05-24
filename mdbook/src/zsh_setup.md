# Zsh 等の環境構築

Linux / Unix の環境がない方は、まずその環境を構築してからこのページを読んでください。
WSL をインストールする、VirtualBox を使う、Windows と Linux のデュアルブート構成にする、などの方法があります。 近くの先輩に聞いてください。


## 1. パッケージのインストール
まず必要なパッケージをインストールします。

Ubuntu を使っている場合は以下のコマンドを実行すればよいです。

```sh
sudo apt update && sudo apt install -y git curl zsh zip unzip tree build-essential
```

macOS を使っている場合は、恐らく以下のコマンドを実行すれば大丈夫です (未検証)。

```sh
brew install git curl zsh zip unzip tree
```


## 2. 教材用リポジトリのクローン
1. 適当なディレクトリを作成してそこへ移動する (自力で出来る人は、自分の好きなディレクトリでOK)
    ```sh
    mkdir -p ~/szpp
    cd ~/szpp
    ```


2. リポジトリをクローンする
    ```sh
    git clone https://github.com/szpp-dev-team/learn-linux-shell.git
    ```



## 3. zsh のセットアップ
1. 設定ファイルをインストールする
    ```sh
    cd ~/szpp/learn-linux-shell
    ./recommended-zsh-config/install.sh
    ```

2. zsh を起動する
    ```sh
    zsh
    ```


3. 【※ 必須ではない】ログインシェル を Zsh に変える  
    Ubuntu では、何も設定していなければ Bash がログインシェルとして設定されています。

    以下のコマンドを実行すると、ログインシェルを Zsh に変更できます。

    ```sh
    sudo chsh -s /bin/zsh
    ```

    ちなみに macOS ではデフォルトで Zsh がログインシェルになっていると思います。
