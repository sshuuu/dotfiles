# About Me

- 日本語と英語どちらでも構わないが、**日常会話や説明は日本語**で返答してほしい
- コミットメッセージ、PR 本文、コード内コメント、識別子は **英語** で書く
- 普段使う言語: TypeScript / Node.js / React、たまに Python
- エディタ: VS Code + Claude Code CLI

# Communication Preferences

- 回答は簡潔に。長い前置きや「承知しました」などの相槌は不要
- 結論 → 根拠 → （必要なら）コード例、の順で
- 自信がない箇所は推測で埋めず「不明」「確認が必要」と明示してほしい
- 不可逆な操作（force push、rm -rf、DB破壊操作など）は必ず事前確認

# Code Style Preferences

- コメントは「なぜ」を書く。「何を」はコードで表現する
- 早期 return を好む。ネストが深い分岐は避ける
- `any` は最終手段。型が分からない場合は `unknown` + type guard
- エラーは黙って握り潰さない。ログに残すか上位へ伝搬
- 関数は 1 画面（〜50行）に収まるのが理想

# Workflow Preferences

- 複雑なタスクは **まず計画（plan）を提示** してから実装に入ってほしい
- ファイル作成より **既存ファイルの編集を優先**
- README や docs/*.md は明示的に依頼した時だけ作成
- 実装後は **型チェック・テスト・lint** を走らせて結果を報告
- git commit は明示的に依頼したときだけ。勝手に commit しない

# Shell 設定の編集ルール

`.zshrc` / `.zshenv` / シェルエイリアス・関数・PATH 等の **シェル設定の追加・変更** を依頼されたときは、まず `~/dotfiles/CLAUDE.md` を読んで編集規約を確認すること。

- `~/.zshenv` / `~/.zsh/.zprofile` / `~/.zsh/.zshrc` は `~/dotfiles/setup.sh` が生成する 1 行スタブの場合がある。直接編集せず `~/dotfiles/zsh/` 配下の対応ファイルを編集する
- 個人マシン固有 (`~/.zsh/fit-aliases.zsh` 等) は dotfiles に含めない

# クレデンシャル管理ルール

サービスの API キー等は **1Password (op CLI) 経由で env 注入する** 設計。`.env` に平文で書かない。

- **CLI 実行**: `~/.zsh/op-runners.zsh` の `op-<service>` 関数経由で実行 (例: `op-clickhouse clickhousectl ...`)
- **クレデンシャル参照ファイル**: `~/.config/<service>/env.1password` に `op://...` 参照のみを記述 (秘密値は持たない)
- **MCP サーバー**: `~/.claude.json` に user-level で登録。OAuth ベースが基本、API key 必須なら `headers` 内で `${VAR}` 展開 → 起動時に `op-<service>` 関数で env を流す
- 新サービス追加手順は `~/.zsh/op-runners.zsh` 冒頭コメント参照
- 既存設定: ClickHouse Cloud (CLI=API key、MCP=OAuth), Datadog (MCP=OAuth)

# Git Preferences

- コミットメッセージは Conventional Commits 形式（feat:, fix:, refactor: ...）
- 1コミット = 1つの論理的変更
- `--no-verify` は使わない
- main / master への force push は絶対禁止

# Things I Don't Want

- 「おそらく」「多分」で根拠なく断定しないでほしい
- コードを書く前に延々と設計を語らないでほしい（短く要点だけ）
- 私が聞いていないリファクタを勝手にやらないでほしい
- 絵文字は明示的に依頼したとき以外は使わないでほしい
