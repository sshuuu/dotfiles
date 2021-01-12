# dotfiles

参照
https://qiita.com/kinchiki/items/57e9391128d07819c321

```
# preztoインストール
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

~/.zpreztorcの編集
zstyle ':prezto:module:prompt' theme 'sorin' の theme の箇所を pure にします。

```
#
# Prompt
#

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'pure'
```

ついでに補完とシンタックスハイライトのモジュールも有効にしておきましょう。設定場所はファイルの最初の方にあります。
'syntax-highlighting' \ と 'autosuggestions' \ を 'prompt' \ の上に記載するだけです。なにかの理由で prompt の上に書かないといけなかった記憶があります（気のせいかも）。

```
# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'syntax-highlighting' \
  'autosuggestions' \
  'prompt' \
```

