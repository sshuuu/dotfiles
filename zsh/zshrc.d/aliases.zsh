# ディレクトリ移動
alias home='cd ~'
alias desk='cd ~/Desktop'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# ファイル操作
alias l='ls -CF'
alias la='ls -la'
alias ll='ls -alF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# システム関連（Mac）
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# ファイルサイズを見やすく表示
alias du='du -h'
alias df='df -h'

# その他便利
alias h='history'
alias c='clear'
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'
alias ip='curl ifconfig.me'
alias weather='curl wttr.in'

mkcd () {
  mkdir -p "$1" && cd "$1"
}

# カスタムリポジトリ作成関数
createrepo() {
  if [[ -z "$1" ]]; then
    echo "使用方法: createrepo-init <リポジトリ名> [--private|--public]"
    return 1
  fi
  
  local repo_name="$1"
  local visibility="${2:---public}"  # デフォルトはpublic
  
  # ローカルリポジトリ初期化
  git init
  echo "# $repo_name" > README.md
  git add README.md
  git commit -m "Initial commit"
  
  # GitHubリポジトリ作成 & リモート設定
  gh repo create "$repo_name" "$visibility" --source=. --remote=origin --push
}
