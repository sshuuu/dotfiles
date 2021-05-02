#!/bin/zsh
if [ -z "$ZDOTDIR" ]; then
  echo "you need to define ZDOTDIR environment variable"
  return 1
fi

mkdir -p $ZDOTDIR 2>/dev/null

############################################
# zprofile, zshrc
############################################
if [ ! -e ${ZDOTDIR:-$HOME}/.zprofile ]; then
    echo "source $HOME/dotfiles/zsh/zprofile" > ${ZDOTDIR:-$HOME}/.zprofile
fi
if [ ! -e ${ZDOTDIR:-$HOME}/.zshrc ]; then
    echo "source $HOME/dotfiles/zsh/zshrc" > ${ZDOTDIR:-$HOME}/.zshrc
fi

############################################
# vim
############################################
ln -sf ~/dotfiles/vimrc $HOME/.vimrc
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

