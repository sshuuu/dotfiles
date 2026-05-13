---
description: "自動的にgit commitを実行"
argument-hint: "[commit message]"
allowed-tools: ["Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(gh pr:*)"]
---

# 自動Git Commit

変更をステージングして Angular Conventional Commit 形式の英語メッセージでコミットします。

引数が指定されている場合は、そのメッセージを使用してコミットします。
引数がない場合は、変更内容を分析して Conventional Commit 形式の英語メッセージを自動生成します。

## 使用例

```
/git-commit feat(auth): add user authentication
/git-commit fix(api): handle null response
/git-commit
```

## Conventional Commit形式について

- **feat**: 新機能の追加
- **fix**: バグ修正
- **docs**: ドキュメント変更
- **style**: コードスタイルの修正（機能に影響なし）
- **refactor**: リファクタリング
- **test**: テストの追加・修正
- **chore**: ビルドやツールの変更
- **perf**: パフォーマンス改善

---

$ARGUMENTS が空でない場合は、そのメッセージで commit を実行してください。
$ARGUMENTS が空の場合は、以下の手順を実行してください：

1. `git status` と `git diff` で変更内容を確認
2. 変更内容を分析し、論理的に独立したトピックの数を判定する
3. **複数トピックが含まれる場合は、分割案 (トピック一覧と各トピックに含めるファイル) をユーザーに提示し、承認を得てから進める**。単一トピックなら 1 コミットにまとめてよい
4. 各トピックについて Angular Conventional Commit 形式の **英語** メッセージを生成する
5. 適切な type（feat, fix, docs, style, refactor, test, chore, perf）を選択
6. スコープ（パッケージ名やモジュール名）を適切に設定
7. 簡潔で分かりやすい **英語** の説明文を作成（件名は 50 文字程度、必要に応じて本文を追加）
8. トピックごとに該当ファイルだけを `git add <files>` し、生成したメッセージで commit を実行する（`git add .` で全変更を一括ステージングしない）

メッセージには必ず以下のフッターを含めてください：

```
Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

複数の異なる種類の変更が 1 つのトピック内に混在する場合は、最も重要な変更を基準に type を決定してください。
