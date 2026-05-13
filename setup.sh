#!/bin/zsh

############################################
# zsh用ディレクトリの作成
############################################
ZDOTDIR=$HOME/.zsh
mkdir -p $ZDOTDIR 2>/dev/null

############################################
# zshenv ファイル作成
############################################
if [ ! -e $HOME/.zshenv ]; then
    echo "export ZDOTDIR=$ZDOTDIR" > $HOME/.zshenv
fi
source $HOME/.zshenv

############################################
# zprofile, zshrc ファイル作成
############################################
if [ ! -e $ZDOTDIR/.zprofile ]; then
    echo "source $HOME/dotfiles/zsh/zprofile" > $ZDOTDIR/.zprofile
fi
if [ ! -e $ZDOTDIR/.zshrc ]; then
    echo "source $HOME/dotfiles/zsh/zshrc" > $ZDOTDIR/.zshrc
fi

############################################
# vim シンボリックリンク作成 &
# vim-plugでプラグインのインストール
############################################
ln -sf $HOME/dotfiles/vimrc $HOME/.vimrc
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

############################################
# ライブラリインストール
############################################
# Homebrew 未導入ならインストール
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # インストール直後は brew が現在シェルの PATH に無いので shellenv を流す
    if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# 必要な brew パッケージを冪等にインストール
# fzf:  ファイルのリスト・フィルター用
# tree: ファイルをtree状に表示
# gh:   github操作用
# ghq:  githubリポジトリ管理用
# asdf: 複数言語のバージョン管理
for pkg in fzf tree gh ghq asdf; do
    if ! brew list "${pkg}" --formula &> /dev/null; then
        echo "Installing ${pkg}..."
        brew install "${pkg}"
    fi
done

