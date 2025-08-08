#######################################
# List GitHub Repository
#######################################
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

#######################################
# List Git Branch
#######################################
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

#######################################
# List GitHub Issues
#######################################
function fzf-github-issues-widget() {
  # 現在のディレクトリがGitリポジトリかチェック
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "エラー: 現在のディレクトリはGitリポジトリではありません"
    return 1
  fi

  # GitHub CLIがインストールされているかチェック
  if ! command -v gh >/dev/null 2>&1; then
    echo "エラー: GitHub CLI (gh) がインストールされていません"
    return 1
  fi

  local issue_info
  # issueの一覧を取得（番号、タイトル、状態を表示）
  issue_info=$(gh issue list --state all --limit 50 --json number,title,state,url \
    --template '{{range .}}#{{.number}} [{{.state}}] {{.title}}{{"\n"}}{{end}}' \
    | fzf --height 40% --preview 'gh issue view $(echo {} | grep -o "^#[0-9]*" | sed "s/^#//")' \
    --preview-window=right:50%:wrap) || return

  if [[ -n "$issue_info" ]]; then
    # issue番号を抽出
    local issue_number
    issue_number=$(echo "$issue_info" | grep -o "^#[0-9]*" | sed 's/^#//')
    
    if [[ -n "$issue_number" ]]; then
      # issueページを開く
      BUFFER="gh issue view --web $issue_number"
      zle accept-line
    fi
  fi
}
zle -N fzf-github-issues-widget
bindkey '^O' fzf-github-issues-widget

#######################################
# List GitHub Pull Requests
#######################################
function fzf-github-pr-widget() {
  # 現在のディレクトリがGitリポジトリかチェック
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "エラー: 現在のディレクトリはGitリポジトリではありません"
    return 1
  fi

  # GitHub CLIがインストールされているかチェック
  if ! command -v gh >/dev/null 2>&1; then
    echo "エラー: GitHub CLI (gh) がインストールされていません"
    return 1
  fi

  local pr_info
  # PRの一覧を取得（番号、タイトル、状態、ブランチ名を表示）
  pr_info=$(gh pr list --state all --limit 50 --json number,title,state,headRefName,baseRefName \
    --template '{{range .}}#{{.number}} [{{.state}}] {{.title}} ({{.headRefName}} → {{.baseRefName}}){{"\n"}}{{end}}' \
    | fzf --height 40% --preview 'gh pr view $(echo {} | grep -o "^#[0-9]*" | sed "s/^#//")' \
    --preview-window=right:50%:wrap) || return

  if [[ -n "$pr_info" ]]; then
    # PR番号を抽出
    local pr_number
    pr_number=$(echo "$pr_info" | grep -o "^#[0-9]*" | sed 's/^#//')
    
    if [[ -n "$pr_number" ]]; then
      # PRページを開く
      BUFFER="gh pr view --web $pr_number"
      zle accept-line
    fi
  fi
}
zle -N fzf-github-pr-widget
bindkey '^P' fzf-github-pr-widget
