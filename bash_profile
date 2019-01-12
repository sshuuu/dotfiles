#######################################
# スクリプト ロード
#######################################
if [ -f ~/dotfiles/.git-prompt.sh ]; then
  . ~/dotfiles/.git-prompt.sh       # gitプロンプト
fi

# カラー変数読み込み
. ~/dotfiles/setcolor.sh

#######################################
# alias
#######################################
alias be='bundle exec'
alias ll='ls -alF'

#######################################
# script
#######################################
function mkcd() { mkdir -p $1 && cd $1; }

#######################################
# gitプロンプト設定
#######################################
# プロンプトに各種情報を表示
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

############### ターミナルのコマンド受付状態の表示変更
# \e エスケープ文字(または\033)
# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $
if [ -z $IS_AWS ]; then
  export PS1=$font_green_blink'\u'$font_default':'$font_blue_blink'\w'$font_red_blink'$(__git_ps1 2> /dev/null)'$font_default' \$ '
else
  export PS1=$font_red'(AWS) '$font_yellow'\u'$font_default':'$font_cyan'\w'$font_magenta'$(__git_ps1 2> /dev/null)'$font_default' \$ '
fi

##############

#######################################
# 環境変数
#######################################
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

