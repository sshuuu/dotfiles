# CLAUDE.md

このリポジトリ (`~/dotfiles`) は shuya の zsh / vim / iTerm2 / git 設定を管理する。
構造・機能の概要は README.md を参照。本ファイルは Claude Code がこのリポジトリで作業するときに守るべき指示を集約する。

## 直接編集してはいけないファイル

以下は `setup.sh` が生成する 1 行スタブで、`source $HOME/dotfiles/zsh/*` を呼び出すだけ。直接編集すると次回の setup.sh による再生成で上書きされる、または dotfiles 側との二重管理になる:

- `~/.zshenv`
- `~/.zsh/.zprofile`
- `~/.zsh/.zshrc`

shell 設定の変更は **必ず `~/dotfiles/zsh/` 配下**を編集する。

## 編集対象の振り分け

| 追加・変更したいもの | 編集ファイル |
|---|---|
| エイリアス、小規模な shell 関数 | `zsh/zshrc.d/aliases.zsh` |
| zsh プラグイン (zinit 経由) | `zsh/zshrc.d/plugins.zsh` |
| ZLE widget / fzf 連携キーバインド | `zsh/zshrc.d/widgets.zsh` |
| バージョンマネージャ等のログインシェル init | `zsh/zprofile` |
| `PATH` 追加、対話シェル全体の bindkey 等 | `zsh/zshrc` |
| vim 設定 | `vimrc` (`~/.vimrc` はシンボリックリンク) |
| iTerm2 設定 | iTerm2 上で変更 → 自動保存設定なら `iterm2/com.googlecode.iterm2.plist` が更新される |

新しい `*.zsh` ファイルを `zsh/zshrc.d/` 配下に追加すると、`zshrc` 末尾の for ループで自動 source される。

## 個人マシン固有のカスタマイズの扱い

shuya 個人のマシンにしか入れたくない設定 (例: `~/.zsh/fit-aliases.zsh`、JDK パス、p10k カスタマイズ) は dotfiles リポジトリに含めない。`~/.zsh/.zshrc` 末尾で個別に source する運用 (この末尾 source 文は setup.sh が作る 1 行スタブの後に手動追記されている)。

dotfiles 側にそれら個人ファイルをコミットしてはいけない。

## 反映方法

dotfiles 側を編集した後の反映:

```zsh
exec zsh                          # 全体を再読み込み (確実)
source ~/dotfiles/zsh/zshrc       # 該当ファイルだけ source し直す (軽量)
```

ターミナルを開き直しても可。

## 検証

shell script を編集したら commit 前に構文チェック:

```zsh
zsh -n <file>
```

`setup.sh` のように冪等性が要求されるスクリプトは、再実行しても害がないことを確認 (パッケージ install は `brew list <pkg> --formula` でガード等)。

## コミット規約

- Conventional Commits 形式 (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:` ...)
- prefix は英語、本文は英語または日本語どちらも可
- 1 コミット = 1 つの論理的変更。typo 修正と機能変更は分ける
- `--no-verify` は使わない

## ブランチ

- デフォルトブランチは `main` のみ (`master` は 2026-05-13 に削除済み)
- 直接 `main` にコミットして push する個人運用 (PR は基本使わない)

## iTerm2 plist の取り扱い

- `iterm2/com.googlecode.iterm2.plist` は XML 形式で管理。バイナリ化された場合は `plutil -convert xml1 <file>` で XML に戻してからコミット
- 設定変更は iTerm2 の "Save changes automatically" で自動同期される設計
