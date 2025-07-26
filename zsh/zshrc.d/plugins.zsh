#######################################
# zinit初期化 & セットアップ
#######################################
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#######################################
# zinitライブラリインストール
#######################################
zinit light zsh-users/zsh-syntax-highlighting
zinit snippet OMZ::plugins/git
# カスタムプロンプト、MesloLGS NFフォントを指定しないと文字化けが発生する
zinit ice depth=1; zinit light romkatv/powerlevel10k

# コマンド補完
# コマンドやファイル名を入力中、Tabを押すことで入力候補を一覧表示する
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

# コマンド補完
# コマンド入力中、入力履歴を元にインタラクティブにコマンドをサジェストする
zinit light zsh-users/zsh-autosuggestions

# サジェストカラーの変更
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

