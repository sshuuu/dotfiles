#######################################
# スクリプト ロード
#######################################
autoload -Uz compinit && compinit

# if [ -f ~/dotfiles/git-prompt.sh ]; then
#   source ~/dotfiles/git-prompt.sh       # gitプロンプト
#   fpath=(~/dotfiles $fpath)
#   zstyle ':completion:*:*:git:*' script ~/dotfiles/git-completion.bash
# fi

# zplugが無ければgitからclone
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# zplugを使う
source ~/.zplug/init.zsh

# 自分自身をプラグインとして管理
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# ここに使いたいプラグインを書いておく
# zplug "ユーザー名/リポジトリ名", タグ
zplug "zsh-users/zsh-completions"
zplug "mafredri/zsh-async"
zplug "peterhurford/git-aliases.zsh"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# zshのフレームワーク
zplug "sorin-ionescu/prezto"
# prezto plugins
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/ruby", from:prezto

zstyle ':prezto:module:prompt' theme 'pure'

# インストールしてないプラグインはインストール
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load –verbose

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# promt
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    echo "NVIM Terminal mode"
    prompt pure
fi

# for nodebrew
export PATH="$PATH:$HOME/.nodebrew/current/bin:$PATH" # Add NodeBrew to PATH for scripting

# for homebrew
export PATH="/usr/local/sbin:$PATH"

# to enable adb command
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

# to enable pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

