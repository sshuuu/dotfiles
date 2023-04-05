# 初期設定

## 事前準備

- 本リポジトリを任意のディレクトリに clone しておく

## 設定手順

1. zsh 設定のため、下記のコマンドを実行してください。

   ```zsh
   source path/to/dotfiles/setup.sh
   ```

1. git 設定のため、下記コマンドを実行し各項目の入力を完了させてください。
   ```zsh
   source path/to/dotfiles/git_setup.sh
   ```
1. 設定を読み込むためログインシェルを更新してください。
1. vim のプラグインをインストールするため、vim 上で:PlugInstall を実行してください。

## バージョン管理について

基本的に asdf を使用してバージョン管理することを推奨します。<br />
asdf の設定については[こちら](https://zenn.dev/cacbahbj/articles/1c7f22260c3e28)を参照してください。

## zsh についての資料

- [zsh の設定ファイルの読み込み順序と使い方 Tips まとめ](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)
