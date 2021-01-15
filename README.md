# dotfiles

## zsh
zshの設定ファイル用ディレクトリを変更するために、`/etc/zprofile`に下記を追記してください。
```bash
export ZDOTDIR=$HOME/.zsh
```

`/etc/zprofile`に環境変数を追記したら下記を実行してください。
```bash
source path/to/dotfiles/setup.sh
```

#### 参照
- [zshの設定ファイルの読み込み順序と使い方Tipsまとめ](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)
