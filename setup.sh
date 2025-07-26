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
# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew install peco
    brew install ghq
fi

# Install asdf via Homebrew
if ! brew list | grep -q "asdf"; then
    echo "Installing asdf via Homebrew..."
    brew install asdf
fi

