[ $# -ne 1 ] && return
mv $HOME/.vim $HOME/.vim.backup
mv $HOME/.vimrc $HOME/.vimrc.backup
mv $HOME/.gvimrc $HOME/.gvimrc.backup

ln -s $1/vim $HOME/.vim
ln -s $1/vim/vimrc $HOME/.vimrc
ln -s $1/vim/gvimrc $HOME/.gvimrc