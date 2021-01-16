# 初期設定

## 事前準備

- 本リポジトリを任意のディレクトリに clone しておく

## 手順

1. zsh 用ファイルの root ディレクトリを変更するために、`/etc/zprofile`に下記を追記します。

```zsh
export ZDOTDIR=$HOME/.zsh
```

2. `/etc/zprofile`に加えた設定を読み込むためターミナルを更新します。

3. ターミナルを更新したら下記のコマンドを実行すれば初期設定完了です。

```zsh
source path/to/dotfiles/setup.sh
```

### 参照

- [zsh の設定ファイルの読み込み順序と使い方 Tips まとめ](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)
