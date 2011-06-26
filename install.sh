#!/bin/sh
DOTFILES=.dotfiles
cd $HOME

ln -s $DOTFILES/gitconfig .gitconfig

ln -s $DOTFILES/vim .vim
ln -s $DOTFILES/vim/vimrc .vimrc
ln -s $DOTFILES/vim/gvimrc .gvimrc

ln -s $DOTFILES/bash .bash
ln -s $DOTFILES/bash/profile .bash_profile

cd $DOTFILES
