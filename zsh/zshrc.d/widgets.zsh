# ghq + fzf + zshウィジェット
function fzf-ghq-widget() {
  local dir
  dir=$(ghq list -p | fzf --preview 'tree -L 1 {}' --height 40%) || return
  if [[ -n "$dir" && -d "$dir" ]]; then
    BUFFER="cd \"$dir\""
    zle accept-line   # コマンドラインを確定して実行
  fi
}
zle -N fzf-ghq-widget  # Zsh Line Editor 関数として登録
bindkey '^G' fzf-ghq-widget

# Gitブランチ選択ウィジェット
function fzf-git-checkout-widget() {
  local branch
  branch=$(git branch --all | grep -v HEAD | sed 's/^..//' | fzf --height 40%) || return
  if [[ -n "$branch" ]]; then
    # remotes/origin/ を削除
    clean_branch=${branch#remotes/origin/}
    BUFFER="git checkout \"$clean_branch\""
    zle accept-line  # コマンドラインを確定して実行
  fi
}
zle -N fzf-git-checkout-widget
bindkey '^B' fzf-git-checkout-widget

