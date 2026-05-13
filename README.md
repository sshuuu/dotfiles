# dotfiles

macOS 用の個人 dotfiles。zsh / vim / iTerm2 / git の設定を含む。

## セットアップ手順

新しい Mac で初期構築する手順。

### 1. リポジトリを clone

```zsh
git clone git@github.com:sshuuu/dotfiles.git ~/dotfiles
```

`setup.sh` および各設定ファイルが `$HOME/dotfiles` をハードコードで参照するため、配置先は `~/dotfiles` を推奨。

### 2. setup.sh を実行

```zsh
source ~/dotfiles/setup.sh
```

以下が自動で行われる:

- `~/.zshenv` を作成し `ZDOTDIR=$HOME/.zsh` を設定
- `~/.zsh/.zprofile` と `~/.zsh/.zshrc` を作成し、それぞれ `~/dotfiles/zsh/{zprofile,zshrc}` を `source` する 1 行を書き込み
- `~/.vimrc` → `~/dotfiles/vimrc` のシンボリックリンク作成
- vim-plug を `~/.vim/autoload/plug.vim` に取得
- Homebrew 未導入の場合: Homebrew をインストール (インストール直後は同シェルで `brew` が使えるよう `shellenv` を eval)
- 必要パッケージ (`fzf` / `tree` / `gh` / `ghq` / `asdf`) のうち未導入のものを Homebrew 経由でインストール (冪等。再実行しても既存パッケージは skip)

### 3. git 設定

```zsh
source ~/dotfiles/git_setup.sh
```

ユーザー名・メールアドレスの入力プロンプトの後、`gh auth login`、git エイリアス、ghq の root 設定までを実行。

### 4. シェル再起動

```zsh
exec zsh
```

または、ターミナルを開き直す。

### 5. vim プラグインインストール

vim を起動して以下を実行:

```vim
:PlugInstall
```

### 6. フォントインストール (重要)

Powerlevel10k プロンプトの表示に **MesloLGS NF** フォントが必須。
[Powerlevel10k フォントガイド](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) からダウンロードしてインストールし、iTerm2 のフォント設定で選択する。

### 7. p10k カスタマイズ (任意)

```zsh
p10k configure
```

ウィザードに従ってプロンプトをカスタマイズ。設定は `~/.zsh/.p10k.zsh` に保存される。

---

## ディレクトリ構成

```
~/dotfiles/
├── README.md
├── setup.sh                          # 初期セットアップスクリプト
├── git_setup.sh                      # git / gh / ghq の初期設定
├── .gitignore
├── vimrc                             # vim 本体設定
├── .vimrc.sample                     # ~/.vimrc に直接書く場合のサンプル
├── zsh/
│   ├── zprofile                      # ログインシェル init
│   ├── zshrc                         # 対話シェル init
│   └── zshrc.d/                      # 機能別分割設定
│       ├── aliases.zsh               # エイリアスと小規模関数
│       ├── plugins.zsh               # zinit + zsh プラグイン群
│       └── widgets.zsh               # fzf 連携の ZLE widget
└── iterm2/
    └── com.googlecode.iterm2.plist   # iTerm2 preferences のエクスポート
```

## シェル起動時の読み込み順

```
~/.zshenv               # 全シェル種別で最初に読まれる
  └→ export ZDOTDIR=$HOME/.zsh

~/.zsh/.zprofile        # ログインシェル時のみ
  └→ source ~/dotfiles/zsh/zprofile
        ├ Homebrew (Apple Silicon)
        ├ asdf
        ├ fzf キーバインド
        ├ rbenv
        ├ direnv
        └ goenv

~/.zsh/.zshrc           # 対話シェル時
  └→ source ~/dotfiles/zsh/zshrc
        ├ bindkey -e             # emacs キーバインド
        ├ EDITOR=vi
        ├ PATH 追加              # ~/.local/bin, /usr/local/sbin, Android tools 等
        └ ~/dotfiles/zsh/zshrc.d/*.zsh を全 source
            ├ aliases.zsh
            ├ plugins.zsh
            └ widgets.zsh
```

dotfiles 側を変更した後は `exec zsh` で再起動するか、対象ファイルを手動 `source` し直す。

## キーバインド

`~/dotfiles/zsh/zshrc.d/widgets.zsh` で定義された fzf 連携の ZLE widget。

| キー | 動作 |
|---|---|
| `Ctrl-G` | `ghq list` を fzf で選択 → 即 `cd` |
| `Ctrl-B` | ローカル + リモートブランチを fzf で選択 → 即 `git checkout` |
| `Ctrl-O` | 現在 repo の GitHub issue 一覧 → 選択して `gh issue view --web` |
| `Ctrl-P` | 現在 repo の GitHub PR 一覧 → 選択して `gh pr view --web` |

`Ctrl-O` と `Ctrl-P` は git リポジトリ内で、かつ `gh auth login` 済みのときのみ動作する。

## エイリアス・関数

`~/dotfiles/zsh/zshrc.d/aliases.zsh` で定義。

### ディレクトリ移動

| エイリアス | 展開 |
|---|---|
| `home` | `cd ~` |
| `desk` | `cd ~/Desktop` |
| `docs` | `cd ~/Documents` |
| `dl` | `cd ~/Downloads` |
| `..` / `..2` / `..3` | 上位ディレクトリへ (1 / 2 / 3 階層) |

### ファイル操作

| エイリアス | 展開 |
|---|---|
| `l` | `ls -CF` |
| `la` | `ls -la` |
| `ll` | `ls -alF` |
| `grep` / `fgrep` / `egrep` | カラー出力 ON |
| `du` / `df` | `-h` (human-readable) |

### macOS 操作

| エイリアス | 動作 |
|---|---|
| `showfiles` | Finder で隠しファイルを表示 |
| `hidefiles` | Finder で隠しファイルを非表示 |
| `flushdns` | DNS キャッシュをフラッシュ |

### その他

| エイリアス | 動作 |
|---|---|
| `h` | `history` |
| `c` | `clear` |
| `reload` | `source ~/.zshrc` |
| `path` | `$PATH` を改行区切りで表示 |
| `ip` | `curl ifconfig.me` (グローバル IP 確認) |
| `weather` | `curl wttr.in` (天気) |

### 関数

`mkcd <dir>`

- ディレクトリを作成して即座にそこへ `cd`

`createrepo <name> [--private|--public]`

- ローカル `git init` → `README.md` 作成 → 初回コミット → GitHub にリポジトリ作成して `push`
- 第 2 引数省略時は `--private`

## zsh プラグイン

`~/dotfiles/zsh/zshrc.d/plugins.zsh` で [zinit](https://github.com/zdharma-continuum/zinit) 経由ロード。初回起動時に zinit 本体が `~/.local/share/zinit/zinit.git` に自動 clone される。

| プラグイン | 役割 |
|---|---|
| `zsh-users/zsh-syntax-highlighting` | コマンドのリアルタイムシンタックス強調 |
| `OMZ::plugins/git` | Oh My Zsh の git エイリアス群 |
| `romkatv/powerlevel10k` | カスタムプロンプト (MesloLGS NF フォント必須) |
| `zsh-users/zsh-completions` | 追加の補完定義 |
| `zsh-users/zsh-autosuggestions` | 履歴ベースの灰色サジェスト (`fg=244`) |

補完の挙動:

- 小文字入力で大文字にもマッチ (`m:{a-z}={A-Z}`)
- 補完候補は Tab / 矢印で選択可能

## vim 設定

- `~/.vimrc` は `~/dotfiles/vimrc` へのシンボリックリンク
- プラグイン管理は [vim-plug](https://github.com/junegunn/vim-plug)
- 新規セットアップ時や設定更新後は vim 上で `:PlugInstall` (または `:PlugUpdate`) を実行

別マシンで `~/dotfiles/vimrc` 全体を読みたくない場合のサンプルとして `.vimrc.sample` を同梱:

```vim
if filereadable(expand('~/dotfiles/vimrc'))
  source ~/dotfiles/vimrc
end
```

## 環境変数管理 (バージョンマネージャ)

`zprofile` で以下を自動初期化 (各コマンドがインストール済みの場合のみ):

- **asdf** — 複数言語の汎用バージョン管理 (推奨)
- **rbenv** — Ruby 専用
- **goenv** — Go 専用
- **direnv** — ディレクトリ単位の環境変数

asdf の使い方は [asdf 入門](https://zenn.dev/cacbahbj/articles/1c7f22260c3e28) を参照。

## iTerm2 設定

iTerm2 の preferences は `~/dotfiles/iterm2/com.googlecode.iterm2.plist` にエクスポート済み。

### 適用方法

1. iTerm2 をインストール

   ```zsh
   brew install --cask iterm2
   ```

2. iTerm2 を起動し、**Preferences** (`Cmd-,`) → **General** → **Preferences** タブを開く
3. **Load preferences from a custom folder or URL** にチェック
4. フォルダとして `~/dotfiles/iterm2` を指定
5. iTerm2 を再起動

これで配色 / フォント / ウィンドウサイズ / キーバインドが復元される。**Save changes** を "Automatically" にしておくと、以降の preferences 変更が `~/dotfiles/iterm2/com.googlecode.iterm2.plist` に自動反映される。

### 設定変更を dotfiles に取り込む

自動保存設定のままなら、iTerm2 で設定変更した時点で plist が更新される。dotfiles リポジトリに反映するには:

```zsh
cd ~/dotfiles
git diff iterm2/com.googlecode.iterm2.plist
git add iterm2/com.googlecode.iterm2.plist
git commit -m "chore(iterm2): update preferences"
git push
```

`defaults export` がバイナリ形式の plist を吐き出す場合、`git diff` がそのままでは読みにくい。差分を確認したいときは:

```zsh
plutil -convert xml1 iterm2/com.googlecode.iterm2.plist
```

で XML に変換してから diff を取ると人間が読める形になる (XML 化後にコミットしても iTerm2 側は問題なく読み込める)。

手動で export したい場合は以下:

```zsh
defaults export com.googlecode.iterm2 ~/dotfiles/iterm2/com.googlecode.iterm2.plist
```

## 更新

```zsh
cd ~/dotfiles
git pull
exec zsh
```

vim プラグインも更新したい場合は vim 上で `:PlugUpdate`。zinit プラグインの更新は:

```zsh
zinit update --all
```

## 参考資料

- [zsh の設定ファイルの読み込み順序と使い方 Tips まとめ](https://qiita.com/muran001/items/7b104d33f5ea3f75353f)
- [asdf 入門](https://zenn.dev/cacbahbj/articles/1c7f22260c3e28)
- [Powerlevel10k フォントガイド](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- [zinit](https://github.com/zdharma-continuum/zinit)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [ghq](https://github.com/x-motemen/ghq)
