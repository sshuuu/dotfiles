#!/bin/zsh
if [ -n "$ZDOTDIR" ]; then
    mkdir -p $ZDOTDIR 2>/dev/null
fi
ln -sf ~/dotfiles/vimrc        $HOME/.vimrc
ln -sf ~/dotfiles/zsh/zprofile ${ZDOTDIR:-$HOME}/.zprofile
ln -sf ~/dotfiles/zsh/zshrc    ${ZDOTDIR:-$HOME}/.zshrc

# install vim-plug
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
