#!/bin/zsh
if [ -n "$ZDOTDIR" ]; then
    mkdir -p $ZDOTDIR 2>/dev/null
fi

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
ln -sf ~/dotfiles/vimrc        $HOME/.vimrc
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
