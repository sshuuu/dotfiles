#######################################
# alias
#######################################
alias be='bundle exec'

#######################################
# script
#######################################

function mkcd() { mkdir -p $1 && cd $1; }

# 2 は標準エラー出力のファイルディスクリプタ。それを/dev/nullに捨てることで標準出力のみを表示
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

function active_gemset_name {
  rbenv gemset active 2> /dev/null | cut -d' ' -f1 | sed -e 's/\(.*\)/ (\1)/'
}

function prompt() {
  local DEFAULT='\[\e[m\]'
  local BLUE='\[\e[1;34m\]'
  local GREEN='\[\e[1;32m\]'
  local RED='\[\e[1;31m\]'
  local BASE="\u"
  PS1="${GREEN}${BASE}${RED}\$(active_gemset_name)${BLUE}:\W\$${GREEN}\$(parse_git_branch)${DEFAULT} "
}

#######################################
# main
#######################################

# プロンプトカスタマイズ
prompt

# git 補完機能ローディング
# . ~/.git-completion.bash

# rbenv使用するためのおまじない
# eval "$(rbenv init -)"

