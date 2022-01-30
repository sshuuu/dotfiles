#!/bin/zsh

ZDOTDIR=$HOME/.zsh
mkdir -p $ZDOTDIR 2>/dev/null

############################################
# zshenv
############################################
if [ ! -e $HOME/.zshenv ]; then
    echo "export ZDOTDIR=$HOME/.zsh" > $HOME/.zshenv
fi
source $HOME/.zshenv

############################################
# zprofile, zshrc
############################################
if [ ! -e ${ZDOTDIR}/.zprofile ]; then
    echo "source $HOME/dotfiles/zsh/zprofile" > ${ZDOTDIR}/.zprofile
fi
if [ ! -e ${ZDOTDIR}/.zshrc ]; then
    echo "source $HOME/dotfiles/zsh/zshrc" > ${ZDOTDIR}/.zshrc
fi

############################################
# vim
############################################
ln -sf ~/dotfiles/vimrc $HOME/.vimrc
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

