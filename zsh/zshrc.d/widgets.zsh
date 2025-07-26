# ghq + fzf + zshウィジェット
function fzf-ghq-widget() {
  local selected_dir
  selected_dir=$(ghq list -p | fzf --preview 'tree -L 1 {}' --height 40%)
  if [ -n "$selected_dir" ]; then
    cd "$selected_dir"
    zle reset-prompt  # プロンプトを更新
  fi
}
zle -N fzf-ghq-widget  # Zsh Line Editor 関数として登録
bindkey '^g' fzf-ghq-widget  # Ctrl+g で実行

# Gitブランチ選択ウィジェット
fzf-git-checkout-widget() {
  local branch
  branch=$(git branch --all | grep -v HEAD | sed 's/^..//' | fzf) && git checkout "$branch"
}
zle -N fzf-git-checkout-widget
bindkey '^B' fzf-git-checkout-widget

